import open3d as o3d
import glob
import time


class Visualizer:
    def __init__(self):
        self.flag_key_space = False
        self.flag_key_exit = False
        self.space_value = 32
        self.exit_value = 256
        self.ply_path = '/home/yjw/KMU_SLAM/data/maintest/1_SLAM.ply'
        self.temp_ply_list = []
        self.lists = []

    def ply_load(self, new_ply_list):
        self.ply_lists = []
        for ply in new_ply_list:
            self.ply_lists.append(o3d.io.read_point_cloud(ply))
            print("{} read complete".format(ply))

    def space_callback(self, vis):
        self.flag_key_space = True
        return False

    def exit_callback(self, vis):
        self.flag_key_exit = True
        return False

    def run(self, ply):
        vis = o3d.visualization.VisualizerWithKeyCallback()
        vis.register_key_callback(self.space_value, self.space_callback)
        vis.register_key_callback(self.exit_value, self.exit_callback)
        self.window = vis.create_window('KMU_SLAM', width = 1920, height = 1080)

        while not self.flag_key_exit:
            # if self.flag_key_space:
            self.lists = glob.glob(self.ply_path)
            if self.temp_ply_list != self.lists:
                # print("exist ply file")
                new_ply_list = list(set(self.lists) - set(self.temp_ply_list))
                self.ply_load(new_ply_list)

                for i in range(len(new_ply_list)):
                    vis.add_geometry(self.ply_lists[i])

                    vis.poll_events()
                    vis.update_renderer()

                print("Add geometry")
                print("update renderer")
                self.temp_ply_list = self.lists

            else:
                vis.poll_events()
                vis.update_renderer()