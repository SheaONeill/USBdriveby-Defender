# USBdriveby-Defender
[SheaONeill] http://Shea.ie [paddycronan] 

# OVERVIEW

This is a third year project/thesis for cyber security /digital forensics.<br />
A Shell script/Security Application (This Is to Guard Against Attackers, cyber espionage that have physical access to system) that will auto-run/execute when an unknown USB device is inserted into a Linux/Unix based operating system. The script scans the device to find hardware ID’s to compare against known blacklisted devices from a database and adds the device if necessary. Logs attacks with details of vendor and product id's of device, which username the attack was perfomed on and a description of the attack vector. Kill all processes that could possibly allow device to run malicious payloads or possible keyboard emulation  Once the script is running to exit from it using Ctrl+C the user must authenticate themselves using a password. Failing authentication the system admins will be notified via text message/email to inform them of intrusion attempt, and the system will be locked down. Meanwhile the script shall gather as much information from the device, and log all details for uploading to server  for further investigation. 

# GOALS:

Once Attacker Inserts Usb/Device A Shell Script On Machine Will Execute.
Scans Hardware Collects Uuid’S And Compares Against Blacklist In Database.
Read keyboard character speed to differentiate between automated input  and human interaction.   
Upon Failing The Speed Test A Photo Via Webcam Is Taken And Alerts Admin Of Intrusion Via Email With The Photo Attachment.
Exports Log Files And Archives Them For Future Inspection, Locks Down The System And Make An Audible Alarm Sound From System.

# KNOWLEDGE AREAS NECESSARY

Linux OS Kernel and Harware Device Managment
Bash Shell Scripting
Disk and file Management
Database Techniques
Currently known Drive-by USB Attacks/Vulnerabilities 

# INSTALLING

Downlod ZIP file, UNZIP, navigate to setup directory, make install.sh executable: `chmod +x install.sh`
execute install.sh `./install.sh` and follow instrucions.  
The database script expects four arguments `$host $dbname $name $pass` <br />
e.g. `[ <ip-address> | <localhost> ] <database_name> <name> <pass>` localhost defender hackme letmein etc.<br />
host must be accurate all other values will be created and db grant permissions will accomadate.<br />

While concentrating on all keyboard input, and after reseaching known  BAD USB/Rubber Duckky linux/unix attacks,
Our finding where that attacks seem to stem from `<alt><f2>` or `<ctrl><alt><t>` which in a nutshell opens a terminal or 
xterm and runs commands.<br />
The Rubber Ducky USB Keyboard emulator has the ability to generate VID and PID numbers so this rules out checking these values against our known attack vendor and product ID's database. But may stil be useful for USB storage/flash devices.<br />
Concentrating on any shell thats opened should run a check for if  a flag was set for flash or keyboard emulator.<br />
If flag was set then run specific script  (see bashrc for details), the script called will gauge human vs non human input speed
and log all stdin for later analysation, then alert admin,take photo of attacker if possible and all other security measures
necessary for instance system lockdown.. system audible beeps to attract attention to breach etc...)
this is our focus at the moment.<br />
Should it be the case that checks assume its human  then the script exits recall commands and executes them <br />


 
