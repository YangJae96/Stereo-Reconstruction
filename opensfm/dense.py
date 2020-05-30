from __future__ import absolute_import
from __future__ import division
from __future__ import print_function
from __future__ import unicode_literals

import logging

import cv2
import numpy as np
from six import iteritems

from opensfm import pydense
from opensfm import io
from opensfm import log
from opensfm import tracking
from opensfm.context import parallel_map, parallel_map_thread, current_memory_usage,  memory_available
import os
import objgraph
from guppy import hpy
import pdb
import gc
import skimage.io
import time
import open3d as o3d

logger = logging.getLogger(__name__)


# raw_depthmap={}
# raw_ply={}
# cleaned_depthmap={}
# cleaned_ply={}
# pruned_depthmap={}
# pruned_ply={}

def compute_depthmaps(data, udata, graph, reconstruction):
    """Compute and refine depthmaps for all shots.

    Args:
        udata: an UndistortedDataset
        graph: the tracks graph
        reconstruction: the undistorted reconstruction
    """
    logger.info('Computing neighbors')
    config = udata.config
    processes = config['processes']
    num_neighbors = config['depthmap_num_neighbors']

    neighbors = {}
    common_tracks = common_tracks_double_dict(graph)
    for shot in reconstruction.shots.values():
        neighbors[shot.id] = find_neighboring_images(
            shot, common_tracks, reconstruction, num_neighbors)


    # file_path='data/stereo_test/undistorted/depthmaps/img0.png.raw.npz.ply'
    # pcd = o3d.io.read_point_cloud(file_path)
    # #pcd.transform([[1, 0, 0, 0], [0, -1, 0, 0], [0, 0, -1, 0], [0, 0, 0, 1]])
    # o3d.visualization.draw_geometries([pcd])
    # exit()

    arguments = []
    for shot in reconstruction.shots.values():
        if len(neighbors[shot.id]) <= 1:
            continue
        mind, maxd = compute_depth_range(graph, reconstruction, shot, config)
        arguments.append((data, udata, neighbors[shot.id], mind, maxd, shot))
    parallel_map_thread(compute_depthmap_catched, arguments, processes)
    #parallel_map(compute_depthmap_catched, arguments, processes)
    
    # data.save_raw_depthmap(raw_depthmap)
    # data.save_raw_ply(raw_ply)

    file_path='data/stereo_test/undistorted/depthmaps/img0.png.raw.npz.ply'
    pcd = o3d.io.read_point_cloud(file_path)
    #pcd.transform([[1, 0, 0, 0], [0, -1, 0, 0], [0, 0, -1, 0], [0, 0, 0, 1]])
    o3d.visualization.draw_geometries([pcd])
   

   
    arguments = []
    for shot in reconstruction.shots.values():
        if len(neighbors[shot.id]) <= 1:
            continue
        arguments.append((data ,udata, neighbors[shot.id], shot))
    parallel_map_thread(clean_depthmap_catched, arguments, processes)
    #parallel_map(clean_depthmap_catched, arguments, processes)

    # data.save_clean_depthmap(cleaned_depthmap)
    # data.save_clean_ply(cleaned_ply)

    arguments = []
    for shot in reconstruction.shots.values():
        if len(neighbors[shot.id]) <= 1:
            continue
        arguments.append((data, udata, neighbors[shot.id], shot))
    parallel_map_thread(prune_depthmap_catched, arguments, processes)
    #parallel_map(prune_depthmap_catched, arguments, processes)
    
    # data.save_pruned_depthmap(pruned_depthmap)
    # data.save_ply_line(pruned_ply)

    merge_depthmaps(data, reconstruction)




def compute_depthmap_catched(arguments):
    try:
        compute_depthmap(arguments)
    except Exception as e:
        logger.error('Exception on child. Arguments: {}'.format(arguments))
        logger.exception(e)


def clean_depthmap_catched(arguments):
    try:
        clean_depthmap(arguments)
    except Exception as e:
        logger.error('Exception on child. Arguments: {}'.format(arguments))
        logger.exception(e)


def prune_depthmap_catched(arguments):
    try:
        prune_depthmap(arguments)
    except Exception as e:
        logger.error('Exception on child. Arguments: {}'.format(arguments))
        logger.exception(e)


def compute_depthmap(arguments):
    """Compute depthmap for a single shot."""
    log.setup()

    data, udata, neighbors, min_depth, max_depth, shot = arguments
    method = udata.config['depthmap_method']

    # if udata.raw_depthmap_exists(shot.id):
    #     logger.info("Using precomputed raw depthmap {}".format(shot.id))
    #     return
    logger.info("Computing depthmap for image {0} with {1}".format(shot.id, method))

    # min_depth=5
    # max_depth=20
    print("min_depth == ",min_depth)
    print("max_depth == ",max_depth)
    
    start=time.time()
    
    de = pydense.DepthmapEstimator()
    de.set_depth_range(min_depth, max_depth, 100)# 24,96
    de.set_patchmatch_iterations(udata.config['depthmap_patchmatch_iterations']) # 3
    de.set_patch_size(udata.config['depthmap_patch_size'])
    de.set_min_patch_sd(udata.config['depthmap_min_patch_sd'])
    add_views_to_depth_estimator(data,udata, neighbors, de)

    if (method == 'BRUTE_FORCE'):
        depth, plane, score, nghbr = de.compute_brute_force()
    elif (method == 'PATCH_MATCH'):
        depth, plane, score, nghbr = de.compute_patch_match()
    elif (method == 'PATCH_MATCH_SAMPLE'):
        #depth, plane, score, nghbr = de.compute_patch_match_sample()
        pass 
    else:
        raise ValueError(
            'Unknown depthmap method type '
            '(must be BRUTE_FORCE, PATCH_MATCH or PATCH_MATCH_SAMPLE)')
    plane=np.zeros((480,640,3))
    score=np.zeros((480,640))
    nghbr=np.zeros((480,640))
    # good_score = score > udata.config['depthmap_min_correlation_score'] # 0.1 
    # depth = depth * (depth < max_depth) * good_score
    
    disparity=skimage.io.imread('disparity.png')
    # baseline=193.001   
    # f=4152.073
    # doffs=213.084
    # depth = baseline * f /(disparity+doffs)

    f=3979.911
    doffs=124.343
    baseline=193.001
    depth = baseline * f /(disparity+doffs)

#     Z depth = baseline*focal/disparity
# X= u*depth/focal
# Y = v*depth/focal 

    # [f sk cx]
    # [0 f cy ]
    # [0 0 1]

    end=time.time() 
    print("Compute Depthmap Time == {:.0f}s".format((end-start)%60))

    # Save and display results
    neighbor_ids = [i.id for i in neighbors[1:]]
    udata.save_raw_depthmap(shot.id, depth, plane, score, nghbr, neighbor_ids)

    depthmap={}
    depthmap.update({'depth':depth})
    depthmap.update({'plane':plane})
    depthmap.update({'score':score})
    depthmap.update({'nghbr':nghbr})
    depthmap.update({'nghbrs':neighbor_ids})

    data.save_raw_depthmap(shot.id, depthmap)

    if udata.config['depthmap_save_debug_files']:
        image = data.udata_image[shot.id]  #load_undistorted_image(shot.id)
        image = scale_down_image(image, depth.shape[1], depth.shape[0])
        ply = depthmap_to_ply(shot, depth, image)

        with io.open_wt(udata._depthmap_file(shot.id, 'raw.npz.ply')) as fout:
            fout.write(ply)
        data.save_raw_ply(shot.id,ply)



def clean_depthmap(arguments):
    """Clean depthmap by checking consistency with neighbors."""
    log.setup()
    data, udata, neighbors, shot = arguments
    # if udata.clean_depthmap_exists(shot.id):
    #     logger.info("Using precomputed clean depthmap {}".format(shot.id))
    #     return
    logger.info("Cleaning depthmap for image {}".format(shot.id))
    dc = pydense.DepthmapCleaner()
    dc.set_same_depth_threshold(udata.config['depthmap_same_depth_threshold'])
    dc.set_min_consistent_views(udata.config['depthmap_min_consistent_views'])
    add_views_to_depth_cleaner(data,udata, neighbors, dc)
    depth = dc.clean()

    # Save and display results
    raw_depth, raw_plane, raw_score, raw_nghbr, nghbrs = data.load_raw_depthmap(shot.id)
    udata.save_clean_depthmap(shot.id, depth, raw_plane, raw_score)
    
    depthmap={}
    depthmap.update({'depth':depth})
    depthmap.update({'plane':raw_plane})
    depthmap.update({'score':raw_score})
    data.save_clean_depthmap(shot.id, depthmap)
    #cleaned_depthmap.update({shot.id:depthmap})

    if udata.config['depthmap_save_debug_files']:
        image = data.udata_image[shot.id]#load_undistorted_image(shot.id)
        
        # opencv는 BGR로 받아서 계산
        image = scale_down_image(image, depth.shape[1], depth.shape[0])
        ply = depthmap_to_ply(shot, depth, image)
        data.save_clean_ply(shot.id,ply)
        #cleaned_ply.update({shot.id:ply})

        with io.open_wt(udata._depthmap_file(shot.id, 'clean.npz.ply')) as fout:
            fout.write(ply)


def prune_depthmap(arguments):
    """Prune depthmap to remove redundant points."""
    log.setup()
    data, udata, neighbors, shot = arguments

    # if udata.pruned_depthmap_exists(shot.id):
    #     logger.info("Using precomputed pruned depthmap {}".format(shot.id))
    #     return
    logger.info("Pruning depthmap for image {}".format(shot.id))

    dp = pydense.DepthmapPruner()
    dp.set_same_depth_threshold(udata.config['depthmap_same_depth_threshold'])
    add_views_to_depth_pruner(data,udata, neighbors, dp)
    points, normals, colors, labels, detections = dp.prune()
    # Save and display results
    udata.save_pruned_depthmap(shot.id, points, normals, colors, labels, detections)
    depthmap={}
    depthmap.update({'points':points})
    depthmap.update({'normals':normals})
    depthmap.update({'colors':colors})
    depthmap.update({'labels':labels})
    depthmap.update({'detections':detections})
    data.save_pruned_depthmap(shot.id, depthmap)
    #pruned_depthmap.update({shot.id:depthmap})

    if udata.config['depthmap_save_debug_files']:
        ply_line=pruned_point_cloud_to_ply(points, normals, colors, labels, detections)
        data.save_ply_line(shot.id, ply_line)
        #pruned_ply.update({shot.id:ply_line})
        with io.open_wt(udata._depthmap_file(shot.id, 'pruned.npz.ply')) as fp:
            ply_line=point_cloud_to_ply(points, normals, colors, labels, detections, fp)


def merge_depthmaps(data, reconstruction):
    """Merge depthmaps into a single point cloud."""
    logger.info("Merging depthmaps")
    shot_ids = [s for s in reconstruction.shots]
    if not shot_ids:
        logger.warning("Depthmaps contain no points.  Try using more images.")
        return
    points = []
    normals = []
    colors = []
    labels = []
    detections = []
    for shot_id in shot_ids:
        p, n, c, l, d = data.load_pruned_depthmap(shot_id)
        points.append(p)
        normals.append(n)
        colors.append(c)
        labels.append(l)
        detections.append(d)

    points = np.concatenate(points)
    normals = np.concatenate(normals)
    colors = np.concatenate(colors)
    labels = np.concatenate(labels)
    detections = np.concatenate(detections)
    

    with io.open_wt(data._depthmap_path() + '/merged.ply') as fp:
        point_cloud_to_ply(points, normals, colors, labels, detections, fp)


    # ply= io.reconstruction_to_ply(data.reconstructions_as_json)
    # with io.open_wt(data._depthmap_path() + '/SLAM.ply') as fout:
    #         fout.write(ply)


def add_views_to_depth_estimator(original_data, udata, neighbors, de):
    """Add neighboring views to the DepthmapEstimator."""
    num_neighbors = udata.config['depthmap_num_matching_views']
    for shot in neighbors[:num_neighbors + 1]:
        assert shot.camera.projection_type == 'perspective'
        color_image = original_data.image_list[shot.id]
        mask = load_combined_mask(udata, shot)
        gray_image = cv2.cvtColor(color_image, cv2.COLOR_RGB2GRAY)
        original_height, original_width = gray_image.shape
        width = min(original_width, int(udata.config['depthmap_resolution']))
        height = width * original_height // original_width
        image = scale_down_image(gray_image, width, height)
        mask = scale_down_image(mask, width, height, cv2.INTER_NEAREST)
        K = shot.camera.get_K_in_pixel_coordinates(width, height)
        R = shot.pose.get_rotation_matrix()
        t = shot.pose.translation
        print("K==",K)
        print("R==",R)
        # print("t==",t)         

        de.add_view(K, R, t, image, mask)


def add_views_to_depth_cleaner(data, udata, neighbors, dc):
    for shot in neighbors:
        depth, plane, score, nghbr, nghbrs = data.load_raw_depthmap(shot.id)
        height, width = depth.shape
        K = shot.camera.get_K_in_pixel_coordinates(width, height)
        R = shot.pose.get_rotation_matrix()
        t = shot.pose.translation
        dc.add_view(K, R, t, depth)


def load_combined_mask(data, shot):
    """Load the undistorted mask.
    If no mask exists return an array of ones.
    """
    mask = data.load_undistorted_combined_mask(shot.id)
    if mask is None:
        size = int(shot.camera.height), int(shot.camera.width)
        return np.ones(size, dtype=np.uint8)
    else:
        return mask


def load_detection_labels(data, shot):
    """Load the undistorted detection labels.
    If no detection exists return an array of zeros.
    """
    if data.undistorted_detection_exists(shot.id):
        return data.load_undistorted_detection(shot.id)
    else:
        size = int(shot.camera.height), int(shot.camera.width)
        return np.zeros(size, dtype=np.uint8)


def load_segmentation_labels(data, shot):
    """Load the undistorted segmentation labels.
    If no segmentation exists return an array of zeros.
    """
    if data.undistorted_segmentation_exists(shot.id):
        return data.load_undistorted_segmentation(shot.id)
    else:
        size = shot.camera.height, shot.camera.width
        return np.zeros(size, dtype=np.uint8)


def add_views_to_depth_pruner(data,udata, neighbors, dp):
    for shot in neighbors:
        
        depth, plane, score = data.load_clean_depthmap(shot.id)
        height, width = depth.shape
        color_image = data.udata_image[shot.id]
        labels = load_segmentation_labels(udata, shot)
        detections = load_detection_labels(udata, shot)
        height, width = depth.shape
        image = scale_down_image(color_image, width, height)
        labels = scale_down_image(labels, width, height, cv2.INTER_NEAREST)
        detections = scale_down_image(detections, width, height, cv2.INTER_NEAREST)
        K = shot.camera.get_K_in_pixel_coordinates(width, height)
        R = shot.pose.get_rotation_matrix()
        t = shot.pose.translation
        dp.add_view(K, R, t, depth, plane, image, labels, detections)


def compute_depth_range(graph, reconstruction, shot, config):
    """Compute min and max depth based on reconstruction points."""
    depths = []
    for track in graph[shot.id]:
        if track in reconstruction.points:
            p = reconstruction.points[track].coordinates
            z = shot.pose.transform(p)[2]
            depths.append(z)

    min_depth = np.percentile(depths, 10) * 0.9
    max_depth = np.percentile(depths, 90) * 1.1

    config_min_depth = config['depthmap_min_depth']
    config_max_depth = config['depthmap_max_depth']

    return config_min_depth or min_depth, config_max_depth or max_depth


def common_tracks_double_dict(graph):
    """List of track ids observed by each image pair.
    Return a dict, ``res``, such that ``res[im1][im2]`` is the list of
    common tracks between ``im1`` and ``im2``.
    """
    tracks, images = tracking.tracks_and_images(graph)
    common_tracks_per_pair = tracking.all_common_tracks(
        graph, tracks, include_features=False)
    res = {image: {} for image in images}
    for (im1, im2), v in iteritems(common_tracks_per_pair):
        res[im1][im2] = v
        res[im2][im1] = v
    return res


def find_neighboring_images(shot, common_tracks, reconstruction, num_neighbors):
    """Find neighboring images based on common tracks."""
    theta_min = np.pi / 60
    theta_max = np.pi / 6
    ns = []
    C1 = shot.pose.get_origin()
    for other_id, tracks in iteritems(common_tracks.get(shot.id, {})):
        if other_id not in reconstruction.shots:
            continue
        other = reconstruction.shots[other_id]
        score = 0
        C2 = other.pose.get_origin()
        for track in tracks:
            if track in reconstruction.points:
                p = reconstruction.points[track].coordinates
                theta = angle_between_points(p, C1, C2)
                if theta > theta_min and theta < theta_max:
                    score += 1
        if score > 20:
            ns.append((other, score))

    ns.sort(key=lambda ns: ns[1], reverse=True)
    return [shot] + [n for n, s in ns[:num_neighbors]]


def angle_between_points(origin, p1, p2):
    a0 = p1[0] - origin[0]
    a1 = p1[1] - origin[1]
    a2 = p1[2] - origin[2]
    b0 = p2[0] - origin[0]
    b1 = p2[1] - origin[1]
    b2 = p2[2] - origin[2]
    dot = a0 * b0 + a1 * b1 + a2 * b2
    la = a0 * a0 + a1 * a1 + a2 * a2
    lb = b0 * b0 + b1 * b1 + b2 * b2
    return np.arccos(dot / np.sqrt(la * lb))


def distance_between_shots(shot, other):
    o1 = shot.pose.get_origin()
    o2 = other.pose.get_origin()
    l = o2 - o1
    return np.sqrt(np.sum(l**2))


def scale_down_image(image, width, height, interpolation=cv2.INTER_AREA):
    width = min(width, image.shape[1])
    height = min(height, image.shape[0])
    return cv2.resize(image, (width, height), interpolation=interpolation)


def depthmap_to_ply(shot, depth, image):
    """Export depthmap points as a PLY string"""
    height, width = depth.shape
    K = shot.camera.get_K_in_pixel_coordinates(width, height)
    R = shot.pose.get_rotation_matrix()
    t = shot.pose.translation
    y, x = np.mgrid[:height, :width]
    v = np.vstack((x.ravel(), y.ravel(), np.ones(width * height)))
    camera_coords = depth.reshape((1, -1)) * np.linalg.inv(K).dot(v)
    points = R.T.dot(camera_coords - t.reshape(3, 1))

    vertices = []
    for p, c, d in zip(points.T, image.reshape(-1, 3), depth.reshape(-1, 1)):
        if d != 0: # ignore points with zero depth
            s = "{} {} {} {} {} {}".format(p[0], p[1], p[2], c[0], c[1], c[2])
            vertices.append(s)

    return io.points_to_ply_string(vertices)


def pruned_point_cloud_to_ply(points, normals, colors, labels, detections):
    """Export depthmap points as a PLY string"""
    lines = _point_cloud_to_ply_lines(points, normals, colors, labels, detections)
    #fp.writelines(lines)
    return lines

def point_cloud_to_ply(points, normals, colors, labels, detections, fp):
    """Export depthmap points as a PLY string"""
    lines = _point_cloud_to_ply_lines(points, normals, colors, labels, detections)
    fp.writelines(lines)


def _point_cloud_to_ply_lines(points, normals, colors, labels, detections):
    yield "ply\n"
    yield "format ascii 1.0\n"
    yield "element vertex {}\n".format(len(points))
    yield "property float x\n"
    yield "property float y\n"
    yield "property float z\n"
    yield "property float nx\n"
    yield "property float ny\n"
    yield "property float nz\n"
    yield "property uchar diffuse_red\n"
    yield "property uchar diffuse_green\n"
    yield "property uchar diffuse_blue\n"
    yield "property uchar class\n"
    yield "property uchar detection\n"
    yield "end_header\n"

    template = "{:.4f} {:.4f} {:.4f} {:.3f} {:.3f} {:.3f} {} {} {} {} {}\n"
    for i in range(len(points)):
        p, n, c, l, d = points[i], normals[i], colors[i], labels[i], detections[i]
        yield template.format(
            p[0], p[1], p[2], n[0], n[1], n[2],
            int(c[0]), int(c[1]), int(c[2]), int(l), int(d))


def color_plane_normals(plane):
    l = np.linalg.norm(plane, axis=2)
    normal = plane / l[..., np.newaxis]
    normal[..., 1] *= -1  # Reverse Y because it points down
    normal[..., 2] *= -1  # Reverse Z because standard colormap does so
    return ((normal + 1) * 128).astype(np.uint8)
