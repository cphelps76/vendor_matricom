Matricom
===============

* 1)Initializing Build Environment
* 2)Downloading Source
* 3)Building
* 4)Flashing


**1.1: Automatic Initialization**

  A script has been created to initialize a developer to build. This script is still a work-in-progress, so a manual setup may still be required.
  
    $ wget https://raw.github.com/Matricom/vendor_matricom/master/tools/setup_environment?token=1652321__eyJzY29wZSI6IlJhd0Jsb2I6TWF0cmljb20vdmVuZG9yX21hdHJpY29tL21hc3Rlci90b29scy9zZXR1cF9lbnZpcm9ubWVudCIsImV4cGlyZXMiOjEzOTU3NTg5NTZ9--8d4fa550c770e42e8979d37637bf6590895ee66b -O setup_environment
    $ sudo chmod +x setup_environment
    $ ./setup_environment
    
  This script will check the utilities required to build the firmware, and will install/update as neccessary.  It will also install the debian packages that are also required to build the Android firmware.
  
  If this step is successfull it will then prompt for you to enter your desired working directory (i.e /home/me/android) and will then repo init the manifest and sync the source.
  
  If this is complete (Checking out 100% and no errors) skip to Step 3
  
**1.2: Manual Initialization**

  To setup the computer for the android building environment the following packages are required:
      
    $ sudo apt-get install git gnupg flex bison gperf build-essential \
        zip curl libc6-dev libncurses5-dev:i386 x11proto-core-dev \
        libx11-dev:i386 libreadline6-dev:i386 libgl1-mesa-glx:i386 \
        libgl1-mesa-dev g++-multilib mingw32 tofrodos \
        python-markdown libxml2-utils xsltproc zlib1g-dev:i386 \
        ia32-libs 
    $ sudo ln -s /usr/lib/i386-linux-gnu/mesa/libGL.so.1 /usr/lib/i386-linux-gnu/libGL.so
  Also, to decrease build time and increase productivity of system execute the following:
        
    $ echo export USE_CCACHE=1 >> ~/.bashrc
        
  We will setup the ccache path after downloading the sources.
  
  Now to obtain the repo command for use with github:
  
    $ mkdir ~/bin
    $ export PATH=~/bin:$PATH
    $ curl https://dl-ssl.google.com/dl/googlesource/git-repo/repo > ~/bin/repo
    $ chmod a+x ~/bin/repo
      
  
**2: Downloading Sources**

  Once the machine is set up completely and properly, it's time to init the manifest and download the souces. Create your working directory and cd to it:
  
    $ mkdir ~/android
    $ cd android
    $ repo init -u https://github.com/Matricom/platform_manifest.git -b master
    $ repo sync (can be increased with the arg of -j# where the number is the number of threads your CPU can handle)
    
  This will take a large amount of time depending on the processor.
  
**3: Building**

  Once the source is synced, it's time to build:
  
    $ cd ~/android
    $ . build/envsetup.sh
    $ lunch
    Choose your lunch target here(g18ref is the mx2 so choose 5)
    $ time mka bacon
    
  And the build will compile
  
**4: Flashing**
  
  Copy the package located in out/target/product/<device> named matricom_<device>_<firmware_revision>.zip to an sdcard or usb drive.
  
  Use the toothpick method to boot into recovery, and select 'apply update from EXT' and then either sdcard or udisk (depending on your sdcard/usb drive).
  
  Select the package and it will install. If you are greeted with installation successful, select 'Reboot System Now'.
  
  
