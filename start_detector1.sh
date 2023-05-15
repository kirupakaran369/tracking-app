#!/bin/sh

# <files_folder_path>, <container_name>, <image_name> and <image_version> should be changed (line 8, 13, 14)

docker rm -f detector
exec docker run -d \
    -v /mnt/tvds/detector:/app/detector/files \
	-v /home/ws/tvds/detector1/dist/index.jsc:/app/detector/dist/index.jsc \
	--restart always \
	-p 7000:8080 \
	--gpus all \
	--env DATABASE_URL="file:/app/detector/files/detector.sqlite" \
	--name detector \
    detector:1.0.0

#	-v /home/ws/tvds/detector/:/app/detector/ \
# /home/ws/programming/cuda_check
# exec docker run -d $(find /dev/ -name "nvidia*" | xargs -I{} echo '--device={}') \
#         $(ls /usr/lib/x86_64-linux-gnu/nvidia/current/* | sed 's/nvidia\/current//g' | xargs -I{} echo '-v {}:{}:ro') \
#         "$@" \
#         -e DISPLAY \
#         -v /home/arjun/Project/tvds/run_data/detector:/app/detector/files \
# 		-p 7000:8080 \
#         -v /tmp/.X11-unix:/tmp/.X11-unix \
#         -v /usr/bin/nvidia-smi:/usr/bin/nvidia-smi:ro \
# 		--env DATABASE_URL="file:/app/detector/files/detector.sqlite" \
#         --name detector \
#         detector:1.0.0
