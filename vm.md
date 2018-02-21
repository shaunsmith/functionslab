You will need a Docker environment to complete this lab.  

## If you have a Mac, just install Docker:

* [https://docs.docker.com/docker-for-mac/install/](https://docs.docker.com/docker-for-mac/install/)

## You can use an Oracle Linux 7 VM with UEK R4, then install Docker:

* [Install Docs](https://docs.oracle.com/cd/E52668_01/E87205/html/section_install_upgrade_yum_docker.html)


## A Virtual box vm can be used as an option:

### 1. Install VirtualBox if needed:

* [Get and Install VirtualBox for your Laptop](http://www.oracle.com/technetwork/server-storage/virtualbox/overview/index.html)

### 2. Download and import an example VM:

* [Download Link](https://drive.google.com/open?id=1b_1Mdmwol8gjkcx4B_VmSLSPDOiBKYr1)

### 3. Note these configuration changes:

* When importing the ova, set CPU and Memory appropriately for your laptop.  Typically, use half of your actual CPU and Memory.
* Once you have imported the VM, you can remove or reconfigure the shared folder (Settings > Shared Folders)

When the VM is running:
* Set Keyboard to US English (set "en1" to "en2" on Top Nav, to the left of the Date and Time)
* Set Proxy Settings in Firefox to "No Proxy" (Preferences > Advanced > Network > Connection > Settings)
* When running the terminal, do not update when prompted, this is not nessecary.
* When running $Sudo -s - the password is "demo"
