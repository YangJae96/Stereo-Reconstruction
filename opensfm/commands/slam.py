import cv2 as cv
import os
from os.path import abspath, join, dirname
import copy
import logging
import argparse
import time
import sys
import numpy as np
import errno
import io
import json
import gzip
import pickle
import six
import networkx as nx
from guppy import hpy

from opensfm import dataset
from opensfm import extract_metadata
from opensfm import detect_features
from opensfm import match_features
from opensfm import create_tracks
from opensfm import reconstruct
from opensfm import mesh_data
from opensfm import undistort
from opensfm import undistorted_dataset
from opensfm import compute_depthmaps
from opensfm import visualizer

from opensfm import log
from opensfm import io
from opensfm import exif
from opensfm import types
from opensfm import config
from opensfm import features
from opensfm import tracking
from opensfm import io
from opensfm.context import current_memory_usage, memory_available

from PIL import Image

logger = logging.getLogger(__name__)
logging.getLogger("Starting Webcam!!").setLevel(logging.WARNING)

class SLAM():
	def __init__(self, data_path, webcam_status):
		self.data_path=data_path
		self.webcam_status=webcam_status
		self.visualizing=visualizer.Visualizer()

	def run(self):
		slam_num=1
		print('available memory== ', memory_available())
		print("current memory usage==", current_memory_usage())
			
		
		webcam=Webcam(self.data_path)

		if self.webcam_status == '0':
			self.image_list = webcam.load_image_list()
		elif self.webcam_status == '1':	
			self.image_list = webcam.save_webcamImage()
		print(self.image_list.keys())
				
		start=time.time()
		self.data=dataset.DataSet(self.data_path,self.image_list)		
		reconstruction = self.reconstruct(self.data)
		end=time.time()
		recon_time=end-start
		print("Reconstruction Time == {:.0f}m {:.0f}s".format(recon_time//60, recon_time%60))

		self.compute_depthmaps(reconstruction)
		stereo_time=time.time()-start
		print("Total Reconstruction Time == {:.0f}m {:.0f}s".format(stereo_time//60, stereo_time%60))

		del webcam
		del self.data 

	def visualize_slam(self, ply, num):		
		slam_num="/{}_SLAM.ply".format(num)
		with io.open_wt(self.data._depthmap_path() + slam_num) as fout:
		        fout.write(ply)        
		self.visualizing.run(ply)

	def reconstruct(self, data):
		recon_3d=Reconstruction(data, self.visualizing)
		recon_3d.Metadata()
		recon_3d.detect_Features()
		recon_3d.match_Features()
		recon_3d.create_tracks()
		reconstruction=recon_3d.reconstruct()
		#self.data.reconstructions=reconstruction
		return reconstruction
	
	def compute_depthmaps(self, reconstruction):
		undistort.run(self.data)
		compute_depthmaps.run(self.data)

		
class Reconstruction(SLAM):
	def __init__(self,data, visualizing):
		self.data=data
		self.visualizing=visualizing
		#super().__init__(data_path, webcam_status)
		
	def Metadata(self):
		self.meta_data=extract_metadata.run(self.data)
		print("meta_data==", self.meta_data)

	def detect_Features(self):
		DF=detect_features.detecting_features()
		DF.run(self.data)

	def match_Features(self):
		MF=match_features.run(self.data)

	def create_tracks(self):
		create_tracks.run(self.data)

	def reconstruct(self):
		reconstruct.run(self.data)
		ply= io.reconstruction_to_ply(self.data.reconstructions_as_json)
		return ply
	# def mesh(self):
	# 	mesh_data.run(self.data)
	# def visualize_slam(self, num):
	# 	ply= io.reconstruction_to_ply(self.data.reconstructions_as_json)
	# 	slam_num="/{}_SLAM.ply".format(num)
	# 	with io.open_wt(self.data._depthmap_path() + slam_num) as fout:
	# 	        fout.write(ply)
	# 	self.visualizing.run()
	
	

class Webcam():
	def __init__(self,data_path):
		self.data_path=data_path

	def save_webcamImage(self):
		cap=cv.VideoCapture(2)
		i=0
		count=1
		self.image_list={}
		image_path=os.path.join(self.data_path,'webcam_images')

		if(cap.isOpened()==False):
		    print("Unable to open the webcam!!")

		while(cap.isOpened()):
		    ret, frame=cap.read()
		    if ret==False:
		        break
		   
		    cv.imshow('camera',frame)
		    if i%40==0:
		    	img_name = "{}.jpg".format(count-1)
		    	cv.imwrite(os.path.join(image_path, img_name),frame)
		    	
		    	self.image_list.update({img_name:frame})
		    	logging.info('Capturing Images for {}'.format(img_name))
		    	
		    	if count%10 ==0:		    		
		    		break
		    	count+=1
		    
		    if cv.waitKey(1) & 0xFF==27:
		        break
		    i=i+1
		cap.release()
		cv.destroyAllWindows()

		return self.image_list

	def load_image_list(self):
		print(self.data_path)
		return self._set_image_path(os.path.join(self.data_path, 'images'))

	def _is_image_file(self, filename):
		extensions = {'jpg', 'jpeg', 'png', 'tif', 'tiff', 'pgm', 'pnm', 'gif'}
		return filename.split('.')[-1].lower() in extensions

	def _set_image_path(self, data_path):

		self.image_list = {}
		if os.path.exists(data_path):
		    for name in os.listdir(data_path):
		        name = six.text_type(name)
		        if self._is_image_file(name):
		        	frame=cv.imread(os.path.join(data_path,name), 1)		
		        	#print(frame.shape)
		        	self.image_list.update({name:frame})
		return self.image_list

def run_slam(args):
	print(args)
	slam=SLAM(args.dataset, args.webcam)
	slam.run()

class Command:
	name = 'slam'
	help = "Starting webcam for image capture"

	def add_arguments(self, parser):
		parser.add_argument('dataset', help='dataset to process')
		parser.add_argument('webcam', help='webcam status 0:off  1: on')

	def run(self, args):
		run_slam(args)

# log.setup()
# args=sys.argv[1]

# save_webcamImage(args)
# print(args)

