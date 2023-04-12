@echo off
ECHO "##### OnePlus 7 Pro Firmware flasher ####"
ECHO "######## Based on GM1911_11_H.38 ########"
ECHO "########## by gwolfu@xda ################"
ECHO "# Make sure phone is in bootloader mode #"
ECHO "#########################################"
fastboot flash --slot=a boot boot.img
fastboot flash --slot=b boot boot.img
fastboot flash --slot=a dtbo dtbo.img
fastboot flash --slot=b dtbo dtbo.img
:start
SET choice=
SET /p choice=Do you want to update modem? (y/n): 
IF NOT '%choice%'=='' SET choice=%choice:~0,1%
IF '%choice%'=='Y' GOTO yes
IF '%choice%'=='y' GOTO yes
IF '%choice%'=='N' GOTO no
IF '%choice%'=='n' GOTO no
IF '%choice%'=='' GOTO no
ECHO "Invalid response"
ECHO.
GOTO start
:yes
fastboot flash --slot=all modem modem.img
:no
echo "###########################################################"
echo "Boot to recovery and navigate to Advanced -> Enter fastboot"
echo "Press enter when ready to continue..."
pause
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
ECHO "###################################"
ECHO "Flash finished :)"
ECHO "You will now get redirected to recovery in order to install crDroid"
fastboot reboot recovery
pause