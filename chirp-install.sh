#! /bin/bash

sudo apt remove brltty -y # remove the braile library, it cause issues with the USB driver

sudo apt install git python3-wxgtk4.0 python3-serial python3-six python3-future python3-requests python3-pip unzip linux-headers-$(uname -r) gcc-12 curl -y # install dependencies

# Add groups to user
sudo usermod -a -G tty ${USER}
sudo usermod -a -G dialout ${USER}

# Alias gcc to v-12
sudo ln -s -f /usr/bin/gcc-12 /usr/bin/gcc

mkdir ~/chirp-setup
cd ~/chirp-setup

# Get and install CH341 driver
wget -O CH341SER.zip https://github.com/juliagoda/CH341SER/archive/refs/heads/master.zip
unzip CH341SER.zip
cd CH341SER-master
# make and load the drivers, to unload the driver "sudo make unload" from this directory
sudo make
sudo make load

# Get and install CHIRP
cd ..
CHIRPURL="$(curl -Ls -o /dev/null -w %{url_effective} https://archive.chirpmyradio.com/download?stream=next)" # get next version url
CHIRPVER=${CHIRPURL:(-9)} # Get Version number
CHIRPVER=${CHIRPVER:0:8} # remove trailing /

wget https://archive.chirpmyradio.com/chirp_next/next-${CHIRPVER}/chirp-${CHIRPVER}-py3-none-any.whl
pip install ./chirp-${CHIRPVER}-py3-none-any.whl


echo "#! /bin/bash" > ~/Desktop/StartChirp.sh
echo "cd ~/chirp-setup/CH341SER-master" >> ~/Desktop/StartChirp.sh
echo "sudo make unload" >> ~/Desktop/StartChirp.sh
echo "sudo make load" >> ~/Desktop/StartChirp.sh
echo "~/.local/bin/chirp" >> ~/Desktop/StartChirp.sh

chmod +x ~/Desktop/StartChirp.sh

echo "Instructions to start chirp saved to desktop, please reboot the machine"
echo "Run StartChirp.sh" > ~/Desktop/Chirp\ Instructions.txt




