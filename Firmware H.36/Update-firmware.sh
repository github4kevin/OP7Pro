#!/bin/bash
echo "##### OnePlus 7 Pro Firmware flasher ####"
echo "######## Based on GM1911_11_H.36 ########"
echo "############ by gwolfu@xda ##############"
echo "# Make sure phone is in bootloader mode #"
echo "#########################################"
fastboot flash --slot=a boot boot.img
fastboot flash --slot=b boot boot.img
fastboot flash --slot=a dtbo dtbo.img
fastboot flash --slot=b dtbo dtbo.img
while true; do
read -p "Do you want to update modem? (y/n) " yn
case $yn in 
	[yY] ) fastboot flash --slot=all modem modem.img; break;;
	[nN] ) break;;
	* ) echo Invalid response;;
esac
done
echo "###########################################################"
echo "Boot to recovery and navigate to Advanced -> Enter fastboot"
read -p "Press enter when ready to continue..."
echo "###################################"
echo "# Start to flash img files in fastbootd mode #"
fastboot flash --slot=all abl abl.img
fastboot flash --slot=all aop aop.img
fastboot flash --slot=all bluetooth bluetooth.img
fastboot flash --slot=all cmnlib64 cmnlib64.img
fastboot flash --slot=all cmnlib cmnlib.img
fastboot flash --slot=all devcfg devcfg.img
fastboot flash --slot=all dsp dsp.img
fastboot flash --slot=all hyp hyp.img
fastboot flash --slot=all keymaster keymaster.img
fastboot flash --slot=all LOGO LOGO.img
fastboot flash --slot=all oem_stanvbk oem_stanvbk.img
fastboot flash --slot=all qupfw qupfw.img
fastboot flash --slot=all storsec storsec.img
fastboot flash --slot=all tz tz.img
fastboot flash --slot=all xbl_config xbl_config.img
fastboot flash --slot=all xbl xbl.img
echo "###################################"
echo "Flash finished :)"
echo "You will now get redirected to recovery in order to install crDroid"
fastboot reboot recovery
read -p "Press enter to exit"