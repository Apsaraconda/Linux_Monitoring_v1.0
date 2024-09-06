# Linux_Monitoring_v1.0
Linux basic bash scripting and system research.

## Part 1. First effort

The script is run with one parameter. It is a text parameter.  
The script outputs the value of the parameter.  
If the parameter is a number, the script must output an invalid input message.

## Part 2. System research

The script outputs the following information:

**HOSTNAME** = _network name_  
**TIMEZONE** = _time zone as: **America/New_York UTC -5** (time zone must be taken from the system and be correct for the current location)_  
**USER** = _current user who ran the script_  
**OS** = _type and version of operating system_  
**DATE** = _current time as: **12 May 2020 12:24:36**_  
**UPTIME** = _system uptime_  
**UPTIME_SEC** = _system uptime in seconds_  
**IP** = _ip address of the machine on any of the network interfaces  
**MASK** = _network mask of any of the network interfaces as: **xxx.xxx.xxx.xxx**_.  
**GATEWAY** = _default gateway ip_  
**RAM_TOTAL** = _main memory size in GB with an accuracy of three decimal places as: **3.125 GB**_  
**RAM_USED** = _used memory size in GB with an accuracy of three decimal places_  
**RAM_FREE** = _free memory size in GB, with an accuracy of three decimal places_  
**SPACE_ROOT** = _root partition size in MB, with an accuracy of two decimal places, as **254.25 MB**_  
**SPACE_ROOT_USED** = _size of used space of the root partition in MB, with an accuracy of two decimal places_  
**SPACE_ROOT_FREE** = _size of free space of the root partition in MB, with an accuracy of two decimal places_

After outputting the values, the script suggests writing the data to a file (asks the user to answer **Y/N**).  
Responses **Y** and **y** are considered positive, all others - negative.

If the user agrees, the script creates a file in the current directory containing the information that had been outputted.
The file name looks like: **DD_MM_YY_HH_MM_SS.status** (The time in the file name indicates when the data was saved).

## Part 3. Visual output design for the system research script

The script is run with 4 parameters. The parameters are numeric. From 1 to 6, for example:  
`script03.sh 1 3 4 5`

Colour designations: (1 - white, 2 - red, 3 - green, 4 - blue, 5 - purple, 6 - black)

**Parameter 1** is the background of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 2** is the font colour of the value names (HOSTNAME, TIMEZONE, USER etc.)  
**Parameter 3** is the background of the values (after the '=' sign)  
**Parameter 4** is the font colour of the values (after the '=' sign)

The font and background colours of one column must not match.  

## Part 4. Configuring visual output design for the system research script

The colour designations are similar. The script runs without parameters. The parameters are set in the configuration file before the script is running.

This is how the configuration file must look like:
```
column1_background=2
column1_font_color=4
column2_background=5
column2_font_color=1
```

If one or more parameters are not set in the configuration file, the colour is substituted from the default colour scheme.

## Part 5. File system research

The script is run with a single parameter.  
The parameter is an absolute or relative path to a directory. The parameter must end with '/', for example:  
`script05.sh /var/log/`

The script outputs the following information about the directory specified in the parameter:
- Total number of folders, including subfolders
- Top 5 folders with largest size in descending order (path and size)
- Total number of files
- Number of configuration files (with .conf extension), text files, executable files, log files (files with .log extension), archives, symbolic links
- Top 10 files with largest size in descending order (path, size and type)
- Top 10 executable files with largest size in descending order (path, size and hash)
- Execution time of the script
