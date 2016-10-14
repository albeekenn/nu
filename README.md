# nu
Northwestern BAC store project

Steps for installing and configuring APEX server...
*********NEEDS PRE-REQS FOR SERVER
*********INCLUDE STEPS FOR INSTALLING JAVA and SQL*PLUS

1. Login to ec2-52-53-225-236.us-west-1.compute.amazonaws.com as ec2-user
	a - install some important packages
	sudo yum install -y zip unzip wget telnet

2. Create a apexuser 
	useradd -d /home/apexuser apexuser
	passwd password
	
3. Switch to apexuser account
	su - apexuser

4. Download APEX 4.1.1 and APEX listener 1.1.4 zip files
	http://www.oracle.com/technetwork/developer-tools/apex/application-express/apex-41-archive-1863572.html
	http://www.oracle.com/technetwork/developer-tools/apex-listener/downloads/apexlistener-114-1886626.html
	
5. Sign into Oracle OTN account:
	a - copy download link from site.

6. On the linux server, use wget command to download files from hyperlink you copied	
	wget <paste url from Oracle OTN site>
	a - rename the zip file to its create name
		mv <filename> <name filename>

7. Do the same for the listener file

8. Extract the APEX 4.1.1 file
	unzip apex_4.1.1.zip

9. Create a new directory and open the APEX listener file:
	mkdir /home/apexuser/apexlistener
	cd /home/apexuser/apexlistener 
	unzip ../apex_listener.1.1.4.zip
	
10. While still in the apexlistener directory, run the APEX listener java program:
	java -Dapex.home=./apex -Dapex.images=/home/apexuser/apex/images -Dapex.erase -jar ./apex.war
	
	The program will prompt you for the following:

		The APEX Listener Administrator username — the default is adminlistener: adminlistener
		A password for the APEX Listener Administrator: password
		The APEX Listener Manager username — the default is managerlistener: managerlistener
		A password for the APEX Listener Administrator: password
		The program will print a URL that you will need in order to complete the configuration:

		INFO: Please complete configuration at: http://localhost:8080/apex/listenerConfigure
		Database is not yet configured 
		
11. Go to your browser, and enter http://ec2-52-53-225-236.us-west-1.compute.amazonaws.com as ec2-user:8080/apex/Configure

12. You will see the Oracle Application Express Listener administration window. Enter the following information:
	Username— APEX_PUBLIC_USER
	Password — password (This is the password that you specified earlier, when you configured the APEX repository.)
	Connection Type— Basic
	Hostname— csis498.csvkeftzg1pl.us-west-1.rds.amazonaws.com
	Port— 1521
	SID— BAC
	Click Apply button and wait for the APEX administration window
	
13. Open another SSH shell as ec2-user.
	a. you will need to set a password for the APEX admin using SQL*Plus
	b. su - apexuser
	c. cd /home/apexuser/apex
	d. sqlplus group2/group2password@csis498.csvkeftzg1pl.us-west-1.rds.amazonaws.com:1521/BAC
	You should be connected to the Oracle RDS as group2 user
	
14. Issue the following SQL commands:
	grant APEX_ADMINISTRATOR_ROLE to group2;
	@apxchpwd.sql
