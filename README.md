# raspberry-multicast-test-streamer

## Intruduction
This is a simple Raspberry Pi-based tester for testing multicast routing, IGMP and other related settings. It continously sends a video stream of nyan cat to a selected 
multicast address and the stream can easily be recieved by a computer with VLC installed.

It is just a very simple design so it will not have many features, basically just the one feature it has is to send a multicast stream. The advantage is that it is cheap to create a couple raspberrys that sends a stream
to a couple of multicast addresses and connect to different parts of a network to quickly be able to test connectivity between different parts of a larger network. For example in a network with several VLAN:s
one can put a raspberry in each and then very quickly check multicast routing for all VLAN:s in different parts of a building. The use I had for this and why i made it was exactly that, to help verify multicast connectivity between two
buildings connected through MPLS, each building has several VLAN:s, and it was necessary to verify that multicast could be reliably sourced from all VLAN:s to all other VLAN:s in the routing domain.

## Installation instructions

This was designed to be run on a freshly installed Raspberry pi with Raspbian (tested with a Raspbian 10 on a raspberry pi 2, 3B+ and 4, but should work with others as well)

1. Install a Raspberry pi with Raspbian 10 (or later)

2. go to the home folder:
	- *cd ~*

3. Update the system
	- *sudo apt update && sudo apt upgrade*

4. Install git and vlc
	- *sudo apt install git vlc*

5. Clone the git repository
	- *git clone https://github.com/grisenengineering/raspberry-multicast-test-streamer*
	
6. Setup the correct IP, Port and TTL for the system
	- *cd raspberry-multicast-test-streamer*
	- *sudo nano steam.sh*
	
	- Edit the setting to what IP, Port and TTL should be needed.
	
7. To run streaming directly on reboot
	- *sudo crontab -e*
	
	- Add the following line to the end:
	- *@reboot /home/pi/raspberry-multicast-test-streamer/stream.sh*
	
8. Done, it should now stream all the time when it is powered up.
