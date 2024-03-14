#THIS REMOVES BRLTTY FROM UBUNTU USED FOR CONNECTING BRAILLE DEVICES IF YOU USE A BRAILLE DEVICE DO NOT RUN THIS

## What is this?
CHIRP is a tool used to program channels into radios. CH341 is a serial to USB driver used to interface the computer to the radio. 

## What does this do?
This installs and sets up [CHIRP](https://chirpmyradio.com/projects/chirp/wiki/Download) and the [CH341SER Linux Patched driver](https://github.com/juliagoda/CH341SER). 

## Why is brltty removed?
This removes brltty as this was causing issues when trying to connect the CH341 devices. There are work arounds to keeping this driver but I found this removing it was the easiest way to ensure the CH341 devices worked reliably. With that being said, do not run this script if you are vision impaired and rely on a braille device. 

## What is installed?
The 2 programs installed are CHIRP and the CH341 driver for serial communication. The prequisites that are installed are:
- Used for CHIRP
  - git
  - python3-wxgtk4.0
  - python3-serial
  - python3-six
  - python3-future
  - python3-requests
  - python3-pip
- Used for CH341 drivers
  - unzip
  - linux-headers-$(uname -r)
  - gcc-12
- Used for my install script to get the most recent version of CHIRP
  - curl

## Usage
1. Download the `chirp-install.sh` file
2. Open terminal at the download location and use the following commands to install
```
chmod +x chirp-install.sh
./chirp-install.sh
```
3. The script will finish and tell you that it has placed instructions on how to run it on the desktop along with a new .sh file that enables the drivers and starts CHIRP. Once the script is complete, reboot your computer.
4. Right click the .sh file on the desktop and choose "Run as program" to start CHIRP and enable the drivers.
5. From here follow the standard CHIRP documentation. 
