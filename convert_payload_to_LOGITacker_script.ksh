#!/bin/ksh
#set -x

# convert payload text to LOGITacker script input
# beta version; a bit clunky, but it seems to work for most text based payloads

usage() {
  echo ""
  echo "Usage: ${0} payload.txt"
  echo ""
  exit 1
}

if [[ -z $1 ]]; then
  echo "No argument passed."
  echo "Exiting."
  usage
fi

if [[ ! -f ${1} ]]; then
  echo "Input text file not detected."
  echo "Exiting."
  usage
fi

# check for fold binary
fold_check=$(which fold)
if [[ -z $fold_check ]]; then
  echo ""
  echo "The fold binary wasn't found."
  usage
fi

# add one line to target text file
# this script might not work if this isn't done
# do this manually in vi if this script doesn't work
# vi payload.txt, G, $, o, Esc, :wq
#echo "" >> $1

# change internal field separator so that spaces are detected correctly
# question mark can be used as long as you don't need to convert a question mark
IFS_BAK=$IFS
IFS="?"

reset_plaintext_string () {
  string=""
  plaintext_char_counter=0
}

cat $1 | while read line
do
  echo $line | fold -w 1 | while read char
  do
    special_char_test=$(echo "$char" | grep -v "^[a-zA-Z0-9.]*$")
    if [[ ! -z $special_char_test ]];then
      if [[ ! -z $string ]];then
        echo "script string $string"
        reset_plaintext_string
      fi
      case $char in
        ' ')  echo "script press SPACE";;
        ',')  echo "script press COMMA";;
        '+')  echo "script press KPPLUS";;
        '=')  echo "script press EQUAL";;
        '-')  echo "script press MINUS";;
        '/')  echo "script press SLASH";;
        ';')  echo "script press SEMICOLON";;
        '"')  echo "script press SHIFT APOSTROPHE";;
        "'")  echo "script press APOSTROPHE";;
        '(')  echo "script press KPLEFTPARENTHESE";;
        ')')  echo "script press KPRIGHTPARENTHESE";;
        '\')  echo "script press BACKSLASH";;
        '[')  echo "script press LEFTBRACE";;
        ']')  echo "script press RIGHTBRACE";;
        *)    echo "special character unaccounted for";;
      esac
    else
      if [[ -z $string ]];then
        reset_plaintext_string
        let plaintext_char_counter=plaintext_char_counter+1
      fi

      if (( $plaintext_char_counter < 100 ));then
        string=$(echo "${string}${char}")
      else
        string=$(echo "${string}${char}")
        echo "script string $string"
	reset_plaintext_string
      fi

      let plaintext_char_counter=plaintext_char_counter+1
    fi
  done
done

# restore IFS value
IFS=$IFS_BAK

if [[ ! -z $string ]];then
  echo "script string $string"
fi

