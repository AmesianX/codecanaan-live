LIVECD_HOME=~/livecd
LIVECD_TMP=/tmp/livecd

ORG_ISO_URL=http://www.ubuntu-mini-remix.org/download/12.10
ORG_ISO_NAME=ubuntu-mini-remix-12.10-i386.iso

CREATE_ISO_NAME=Ubuntu-cusmize-livecd.iso

DEPLOY_LOC=/media/sf_Spooky/Downloads
DEPLOY_REMOTE=spooky@codecanaan.com:/home/spooky


all: clean

clean: 
	- sudo umount ${ORG_ISO_NAME}
	- sudo umount ${LIVECD_TMP}/casper/filesystem.squashfs
	- sudo umount ${LIVECD_HOME}/custom/proc/
	- sudo umount ${LIVECD_HOME}/custom/sys/
	sudo rm -rf ${LIVECD_HOME}
init: clean
	wget -nc ${ORG_ISO_URL}/${ORG_ISO_NAME}
	sudo apt-get install squashfs-tools dchroot
	- mkdir ${LIVECD_TMP}
	- sudo mount -o loop ${ORG_ISO_NAME} ${LIVECD_TMP}
	- mkdir -p ${LIVECD_HOME}/cd
	rsync --exclude=/casper/filesystem.squashfs -a ${LIVECD_TMP}/ ${LIVECD_HOME}/cd
	- mkdir ${LIVECD_HOME}/squashfs  ${LIVECD_HOME}/custom
	sudo modprobe squashfs
	- sudo mount -t squashfs -o loop ${LIVECD_TMP}/casper/filesystem.squashfs ${LIVECD_HOME}/squashfs/
	sudo cp -a ${LIVECD_HOME}/squashfs/* ${LIVECD_HOME}/custom
	sudo cp /etc/resolv.conf /etc/hosts ${LIVECD_HOME}/custom/etc/	

	
install: init
	#copy sources.list
	sudo cp /etc/apt/sources.list ${LIVECD_HOME}/custom/etc/apt/sources.list
	# copy install script
	sudo chmod +x install.sh
	sudo cp install.sh ${LIVECD_HOME}/custom/home/
	
	sudo rsync -av etc/skel ${LIVECD_HOME}/custom/etc/
	#- rm ~/ClientTools.zip
	- wget -nc http://assets.codecanaan.com/standalone/ClientTools.zip ~/
	sudo unzip -B ClientTools.zip -d ${LIVECD_HOME}/custom/home/
	sudo chroot ${LIVECD_HOME}/custom /home/./install.sh

build: install
	chmod +w ${LIVECD_HOME}/cd/casper/filesystem.manifest
	sudo chroot ${LIVECD_HOME}/custom dpkg-query -W --showformat='${Package} ${Version}\n' > ${LIVECD_HOME}/cd/casper/filesystem.manifest
	sudo cp ${LIVECD_HOME}/cd/casper/filesystem.manifest ${LIVECD_HOME}/cd/casper/filesystem.manifest-desktop
	sudo mksquashfs ${LIVECD_HOME}/custom ${LIVECD_HOME}/cd/casper/filesystem.squashfs
	cd ${LIVECD_HOME}/cd ;sudo mkisofs -r -V "Ubuntu-cusmize-livecd" -b isolinux/isolinux.bin -c isolinux/boot.cat -cache-inodes -J -l -no-emul-boot -boot-load-size 4 -boot-info-table -o ~/${CREATE_ISO_NAME} .

deploy: build
	scp ~/${CREATE_ISO_NAME} ${DEPLOY_REMOTE}

deploy_loc: build
	cp ~/${CREATE_ISO_NAME} ${DEPLOY_LOC}

test:
	qemu-system-i386 -cdrom ~/${CREATE_ISO_NAME} -boot d -m 512


	
