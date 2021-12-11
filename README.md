![Logo](https://i.ibb.co/d628X2Z/logo.png)

[![GitHub release](https://img.shields.io/badge/release-v1-brightgreen?style=flat)](https://github.com/adilsoybali/Log4j-RCE-Scanner/releases/tag/v1.0)
[![GitHub stars](https://img.shields.io/github/stars/adilsoybali/Log4j-RCE-Scanner.svg?style=flat)](https://github.com/adilsoybali/Log4j-RCE-Scanner/stargazers)
[![GitHub forks](https://img.shields.io/github/forks/adilsoybali/Log4j-RCE-Scanner?style=flat)](https://github.com/adilsoybali/Log4j-RCE-Scanner/network)
[![GitHub issues](https://img.shields.io/github/issues/adilsoybali/Log4j-RCE-Scanner.svg?style=flat)](https://github.com/adilsoybali/Log4j-RCE-Scanner/issues)
[![GitHub license](https://img.shields.io/github/license/adilsoybali/Log4j-RCE-Scanner.svg?style=flat)](https://github.com/adilsoybali/Log4j-RCE-Scanner/blob/master/LICENSE)
![GitHub license](https://img.shields.io/github/repo-size/adilsoybali/Log4j-RCE-Scanner.svg?style=flat)
# RCE scanner for Log4j
Using this tool, you can scan for remote command execution vulnerability CVE-2021-44228 on Apache Log4j at multiple addresses.
## Features
- It can scan according to the url list you provide.
- It can scan all of them by finding the subdomains of the domain name you give.
## Installation
 1. `git clone https://github.com/adilsoybali/Log4j-RCE-Scanner.git`
 2. `cd Log4j-RCE-Scanner`
 3. `chmod +x log4j-rce-scanner.sh`
> If you want to scan with a domain name, you must additionally install [subfinder](https://github.com/projectdiscovery/subfinder), [assetfinder](https://github.com/tomnomnom/assetfinder) and [amass](https://github.com/OWASP/Amass).
## Usage

    ./log4j-rce-scanner.sh -h

This will display help for the tool. Here are all the switches it supports.


    -h, --help - Display help
    -l, --url-list - List of domain/subdomain/ip to be used for scanning.
    -d, --domain - The domain name to which all subdomains and itself will be checked.
    -b, --burpcollabid - Burp collabrator client id address or interactsh domain address.
    
    Example uses:
    ./log4j-rce-scanner.sh -l httpxsubdomains.txt -b yrt45r4sjyoj19617jem5briio3cs.burpcollaborator.net
    ./log4j-rce-scanner.sh -d adilsoybali.com -b yrt45r4sjyoj19617jem5briio3cs.burpcollaborator.net

[Click here to go to Interactsh.](https://app.interactsh.com/#/)

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are  **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## Contact

Adil Soybalı -  [@adilsoybali](https://twitter.com/adilsoybali)  -  [info@adilsoybali.com](mailto:info@adilsoybali.com)

## Acknowledgments

-   [LunaSec](https://www.lunasec.io/docs/blog/log4j-zero-day/)
