# LOGITacker_script_generator
beta version 0.1 - 04JAN2020

This is for generating ducky style script for the LOGITacker.
Specify your text based payload as the first argument to the script.
Only Linux is supported.

# install needed packages
- apt-get install ksh

## Usage: ./LOGITacker_script_generator.ksh payload.txt

- Known issues: 
    - some special characters might not be supported in the script yet

- TODO: 
    - implement more support for common special characters that are usually found in plaintext based payloads; usually powershell or batch files
