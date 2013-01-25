all: clean

clean: 
	- sudo umount ubuntu-mini-remix-12.10-i386.iso
	- sudo umount /tmp/livecd/casper/filesystem.squashfs
	- sudo umount ~/livecd/custom/proc/
	- sudo umount ~/livecd/custom/sys/
	sudo rm -rf ~/livecd
init: clean
	wget -nc http://www.ubuntu-mini-remix.org/download/12.10/ubuntu-mini-remix-12.10-i386.iso
	sudo apt-get install squashfs-tools dchroot
	- mkdir /tmp/livecd
	- sudo mount -o loop ubuntu-mini-remix-12.10-i386.iso /tmp/livecd
	- mkdir -p ~/livecd/cd
	rsync --exclude=/casper/filesystem.squashfs -a /tmp/livecd/ ~/livecd/cd
	- mkdir ~/livecd/squashfs  ~/livecd/custom
	sudo modprobe squashfs
	- sudo mount -t squashfs -o loop /tmp/livecd/casper/filesystem.squashfs ~/livecd/squashfs/
	sudo cp -a ~/livecd/squashfs/* ~/livecd/custom
	sudo cp /etc/resolv.conf /etc/hosts ~/livecd/custom/etc/	
	#copy sources.list
	sudo cp /etc/apt/sources.list ~/livecd/custom/etc/apt/sources.list
	# copy install script
	- sudo rm ~/livecd/custom/home/install.sh
	sudo chmod +x install.sh
	sudo cp install.sh ~/livecd/custom/home/
	
	sudo rsync -av etc/skel ~/livecd/custom/etc/
	#- rm ~/ClientTools.zip
	- wget -nc http://assets.codecanaan.com/standalone/ClientTools.zip ~/
	sudo unzip -B ClientTools.zip -d ~/livecd/custom/home/
	

install: init
	sudo chroot ~/livecd/custom /home/./install.sh

build: install
	chmod +w ~/livecd/cd/casper/filesystem.manifest
	sudo chroot ~/livecd/custom dpkg-query -W --showformat='${Package} ${Version}\n' > ~/livecd/cd/casper/filesystem.manifest
	sudo cp ~/livecd/cd/casper/filesystem.manifest ~/livecd/cd/casper/filesystem.manifest-desktop
	sudo mksquashfs ~/livecd/custom ~/livecd/cd/casper/filesystem.squashfs
	cd ~/livecd/cd ;sudo mkisofs -r -V "Ubuntu-cusmize-livecd" -b isolinux/isolinux.bin -c isolinux/boot.cat -cache-inodes -J -l -no-emul-boot -boot-load-size 4 -boot-info-table -o ~/Ubuntu-cusmize-livecd.iso .

deploy: build
	scp ~/Ubuntu-cusmize-livecd.iso spooky@codecanaan.com:/home/spooky

deploy_loc: build
	cp ~/Ubuntu-cusmize-livecd.iso /media/sf_Spooky/Downloads

test:
	qemu-system-i386 -cdrom ~/Ubuntu-cusmize-livecd.iso -boot d -m 512


	
