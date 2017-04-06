# USBdriveby-Defender
[SheaONeill] http://Shea.ie [PaddyOTG] 

# OVERVIEW

A Shell script/Security Application (This Is to Guard Against Attackers, cyber espionage that have physical access to system) that will auto-run/execute when an unknown USB device is inserted into a Linux/Unix based operating system. The script scans the device to find hardware ID’s to compare against known devices from a database and adds the device if necessary. Kill all processes that could possibly allow device to run malicious payloads or possible keyboard emulation  The script using a menu will give the user/attacker an opportunity to review any steps they wish to take thus giving them the opportunity to walk away with their device with no harm done should they be innocent. The menu will include a terms and agreements giving the user/attacker prior knowledge of what the script consists of and how it will affect their device and legal implications should they accept/continue. System admins will be notified via text message/email to inform them of intrusion attempt. Meanwhile the script shall gather as much information from the device, file and folder structure, executables. history to track attacker and/or create profile of attacker  for further investigation. 

# GOALS:

Once attacker Inserts USB/Device 
Shell Script on Machine Will Execute
Alerts admin of intrusion via text-messaging/email (if connected to internet)
Records audio/video/photograph/image via webcam and recording device (if applicable) and streams/uploads to remote server
Scans Hardware collects UUID’s and compares against database. Checking for disk structure and partition information and anything irregular compared to standards for that particular device.
Encrypts device so passphrase is necessary for any further actions concerning device (should it be removed and inserted in another machine) 
Scans software and executables on device to compare against drive-by database for latest known threats techniques.
Exports file and directory structure to log file for future inspection (if attacker removes device before proceeding to next stage )

# KNOWLEDGE AREAS NECESSARY

Linux OS
Bash Shell Scripting
Networking Security/Net filters
Disk and file Management
Disk and file Encryption
Imaging/Forensic Tools
Database Techniques
Currently known Drive-by USB Attacks/Vulnerabilities 

# MENU EXAMPLE:

You must read terms and agreements before any other action.
* View Files (allow attacker to view-only the files on the device) (chmod/chroot/chown)
* Run (allow execution of script(not-really) needs passphrase)
* Format (format the device) needs passphrase)
* Eject (safely remove device (walk-away clause))
* Exit (exit this menu – needs passphrase)
* T. Terms and Agreements

Should any menu item selected that needs a passphrase an “Are you sure you want to continue (Y/N)” message will display.  Note: This Will Be Looking for A Passphrase E.G. MySecretPassPhrase as the script sequence has already been initiated (as pointed out/described in terms and agreements (past the point of no return))
If the Password Is Incorrect Then Script Will:
Display a please wait initialising message this will make the user/attacker feel a sense of accomplishment this message could be in the form of a basic loop which does nothing else but show a loading sequence of some form.
Meanwhile the script will: 
Create an image of the device. (if any hidden partitions were found in initial scan these will be imaged first should the device be manually removed, this will give us some info as to what the attacker was trying to achieve and can be added to the database of known threats if unknown)
`edit` the following was deemed `unethical`:
As a precaution in the case of the attacker using device on another machine after attempting to breach our machine the device is rendered unusable for any subsequent attacks. 
Start DD 6 Phase Wipe E.g. Zeros, Urandom, Zeros, Urandom, Zeros, Urandom (this will prevent user/attacker from recovering data should the try recovering partitions after the next phase.)
Start FDisk or similar  to create new partitions matching the original device structure 
Recreate file and folder structure filling with corrupted/unreadable/unusable data ensuring all slack space and unallocated space is unrecoverable. 


# OTHER OPTIONS:

Find all devices/machines that user/attacker has inserted malicious into and compare against in-house machines this will help up not only find machines that have been corrupted but also track the movements of the attacker via date and timestamps and compare with in-house security footage.
Send the attacker elsewhere for instance honeypot with so-called confidential/other files these files would be constantly updated to give the impression that it is the currently used system. (A simplistic method to do this using a script that runs as a cronjob to find random files or list-based, maybe based on inode numbers and use the touch or copy commands to update timestamps)
Create an automated script to run on attacker device that will send tracking information to admins should attacker move onto another machine or should attacker insert in his own machine to try a figure out what went wrong with his attack.
Read keyboard character speed to differentiate between automated input  and human interaction.   

# INSTALLING

*Work in Progress*
Downlod ZIP file, UNZIP, navigate to setup directory, make install.sh executable: `chmod +x install.sh`
execute install.sh `./install.sh` and follow instrucions.  
The database script expects four arguments `$host $dbname $name $pass`
e.g. `<ip-address>or<localhost> <database_name> <name> <pass>` localhost defender root toor etc.

# CHANGELOG

This code is not fully functional as of yet, read the comments in the scripts for details
while concentrating on all keyboard input, after researhing known  BAD USB/Rubber Duckky linux/unix attacks,
which seem to stem from `<alt> <f2> or <ctrl><alt><t>` which in a nutshell opens a terminal or 
xterm and runs commands. 
So a decision was made to concentrate on: any shell thats opened should run a check for if  a flag was set for flash or keyboard emulator
if flag was set then run specific script  (see bashrc for details), the script called will gauge human vs non human input speed
and log all stdin for later analysation, then (TODO alert admin,take photo of attacker if possible and any other security measures
necessary for instance system lockdown.. system audible beeps to attract attention to breach etc...)
this is our focus at the moment 
should checks assume its human  then script exits then (TODO recall commands and execute)
to be continued............
 
