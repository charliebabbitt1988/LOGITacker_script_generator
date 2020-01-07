# LOGITacker_script_generator
beta version 0.2 - 05JAN2020

This is for generating ducky style script for the LOGITacker.
Specify your text based payload as the first argument to the script.
Only Linux is supported.

# install needed packages
- apt-get install ksh
- apt-get install python3
- pip3 install yoctopuce

### Usage: convert_payload_to_LOGITacker_script.ksh payload.txt
This script converts your payload.txt to ducky style script that can be saved.


### Usage: generate_and_execute_powershell_for_target_injection.ksh payload.txt > payload.ksh
###        chmod 700 payload.ksh;./payload.ksh
This script is mostly for testing payloads.  After payload.ksh is created, you can execute payload.ksh to test its functionality.  This is not recommended for field use because of the long execution time.  It will load the script to the dongle memory before it executes, which can be slow.


### Usage: save_payload_script_to_dongle.ksh payload.txt script_name_to_run_to_save_to_dongle.ksh script_name_for_dongle
### Argument 1: the text file for your payload
### Argument 2: the script that will be created; when run this will save the script to the dongle.
### Argument 3: the name of the script that will be saved to the dongle with "script store"
This script will load a payload to the dongle as a saved script that can be executed later against a target.


- Known issues: 
    - some special characters might not be supported in the script yet; backslash is not supported due to ksh shell behavior
    - there has to be more than 1 line in the payload text file; if there is only 1 line of text, then add a blank line underneath that line

- TODO: 
    - implement more support for common special characters that are usually found in plaintext based payloads; usually powershell or batch files
    - Test other dongles.  Only the April Brother nRF52840 Dongle has been tested.
