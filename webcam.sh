#!/bin/bash
#echo "say cheese" | festival --tts
espeak -ven+f3 -k5 -s150 "Say cheese" &> /dev/null
sleep 5;
FILENAME="shot-`date +%F.%H-%M-%S`.jpg"
FILE="/tmp/$FILENAME"
#echo "Ca-cheek" | festival --tts &
espeak -ven+f3 -k5 -s150 "Ca Cheek" &> /dev/null
/opt/vc/bin/raspistill --nopreview -t 3 -w 1280 -h 960 -o $FILE
if [ "$?" != "0" ]; then exit 1; fi

if [ $(identify -format "%[mean]" $FILE | cut -d '.' -f 1) -gt 5000 ]; then
    if [ $(expr $RANDOM % 10) -eq 0 ]; then
        /usr/bin/composite webcam/ghostoverlay.png $FILE $FILE
    fi
fi

/usr/bin/scp -p $FILE irccat@www.somakeit.org.uk:www
if [ "$?" != "0" ]; then exit 1; fi
echo "FORCE_CHANNEL:General"
echo "$1 your photo is at: http://irccat.somakeit.org.uk/$FILENAME"
rm $FILE
