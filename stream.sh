#! /bin/bash

# Path to the videofile to stream
videofile=/home/pi/raspberry-multicast-test-streamer/nyan_cat.mp4

# Network settings
ip=239.255.1.1 # multicast IP to stream video to
port=5004 # port number
ttl=5 # TTL of the multicast packages

# User to run vlc since VLC can not be run as root
videouser=pi

# Run the video as a loop and stream it to the network
sudo -u $videouser cvlc -vvv $videofile --sout "#rtp{dst=$ip,port=$port,mux=ts,sap,name=Nyan}" --no-sout-all --sout-keep --ttl=$ttl --loop
