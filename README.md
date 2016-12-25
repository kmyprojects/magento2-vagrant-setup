# magento2-vagrant-setup
Vagrant Setup for Magento 2 Developers

Setup Includes Apache 2, Php 7.0, Mysql 5.6 and required PHP extensions

# Getting Started with Requirements
1. Install Virtual Box from https://www.virtualbox.org/wiki/Downloads
2. Install Vagrant from https://www.vagrantup.com/downloads.html
3. Install Git Bash for windows or Use Terminal for Mac

# Instructions for setting up Vagrant Box
1. Create a virtual local host. Ex 192.168.13.1 mage2.dev
2. Make a directory of your choice 
3. Clone the Vagrant File and Setup.sh file to the above created directory
4. Replace directory path in Vagrant File if your using Mac
5. Change the IP address according to Virtual local host
6. Make sure you use unused forward ports in Vagrant File
7. Update Memory allotment as per your wish 2048M is minimum
8. Use command "vagrant up" using ssh/git bash/terminal to start vagrant setup
9. Setup must show "Process finished with exit code 0"
10. Now with in ssh, login to mysql server and create database.

# Instructions for Installing Magento 2
1. Download Latest Magento 2 to local directory created above
2. Open virtual local host in browser
3. Start setting up magento and provide above created database details.


# Thank you.
If you found difficulty you can always contact me via kmyprojects@gmail.com

Also, your always welcome to enhance this setup
