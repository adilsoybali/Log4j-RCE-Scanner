<h1 align="center">
  <img src="https://i.ibb.co/d628X2Z/logo.png" alt="Log4j-RCE-Scanner" width="50%"></a>
  <br>
</h1>

<p align="center">
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner/"><img src="https://img.shields.io/badge/release-v2-brightgreen?style=flat"></a>
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner/stargazers"><img src="https://img.shields.io/github/stars/adilsoybali/Log4j-RCE-Scanner.svg?style=flat"></a>
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner/network/members"><img src="https://img.shields.io/github/forks/adilsoybali/Log4j-RCE-Scanner?style=flat"></a>
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner/issues"><img src="https://img.shields.io/github/issues/adilsoybali/Log4j-RCE-Scanner.svg?style=flat"></a>
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner/"><img src="https://img.shields.io/github/repo-size/adilsoybali/Log4j-RCE-Scanner.svg?style=flat"></a>
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner/blob/master/LICENSE"><img src="https://img.shields.io/github/license/adilsoybali/Log4j-RCE-Scanner.svg?style=flat"></a>
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner/commits/main"><img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/adilsoybali/Log4j-RCE-Scanner">
</p>
<p align="center">
  <a href="https://github.com/adilsoybali/Log4j-RCE-Scanner#Features">Feature</a> •
  <a href="https://github.com/adilsoybali/Log4j-RCE-Scanner#Requirements">Requirements</a> •
  <a href="https://github.com/adilsoybali/Log4j-RCE-Scanner#Installation">Installation</a> •
  <a href="https://github.com/adilsoybali/Log4j-RCE-Scanner#Usage">Usage</a> •
  <a href="https://github.com/adilsoybali/Log4j-RCE-Scanner#Contact">Contact</a>
</p>

---
      
# RCE scanner for Log4j
Using this tool, you can scan for remote command execution vulnerability CVE-2021-44228 on Apache Log4j at multiple addresses.
> [Affected versions < 2.15.0](https://logging.apache.org/log4j/2.x/security.html)
## Features
- It can scan according to the url list you provide.
- It can scan all of them by finding the subdomains of the domain name you give.
- It adds the source domain as a prefix to determine from which source the incoming dns queries are coming from.
## Requirements
1. [httpx](https://github.com/projectdiscovery/httpx)
2. [curl](https://curl.se/download.html)
> If you want to scan with a domain name, you must additionally install [subfinder](https://github.com/projectdiscovery/subfinder), [assetfinder](https://github.com/tomnomnom/assetfinder) and [amass](https://github.com/OWASP/Amass).
## Installation
 1. `git clone https://github.com/adilsoybali/Log4j-RCE-Scanner.git`
 2. `cd Log4j-RCE-Scanner`
 3. `chmod +x log4j-rce-scanner.sh`
 
 
<a href="https://github.com/adilsoybali/Log4j-RCE-Scanner#Installation"><img src="https://i.ibb.co/dkxsydt/Log4j-RCEScanner.png"></a>
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

[Click here to go to Burp collaborator documentation page.](https://portswigger.net/burp/documentation/collaborator)

[Click here to go to Interactsh.](https://app.interactsh.com/#/)

> If the domain is vulnerable, dns callbacks with the vulnerable domain name is sent to the burp collaborator or interactsh address you provided.

## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are  **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement". Don't forget to give the project a star! Thanks again!

1.  Fork the Project
2.  Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3.  Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4.  Push to the Branch (`git push origin feature/AmazingFeature`)
5.  Open a Pull Request

## Contact

<p>
<a href="mailto:info@adilsoybali.com" target="_blank"><img align="center" src="https://img.shields.io/static/v1?style=for-the-badge&message=Email&color=EA4335&logo=Gmail&logoColor=FFFFFF&label=" alt="Email" /></a>
<a href="https://linkedin.com/in/adilsoybali" target="_blank"><img align="center" src="https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white" alt="Linkedin" /></a>
<a href="https://discord.com/channels/@AdilSoybali#0044" target="_blank"><img align="center" src="https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white" alt="Discord" /></a>
<a href="https://twitter.com/adilsoybali" target="_blank"><img align="center" src="https://img.shields.io/badge/Twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white" alt="Twitter" /></a>
<a href="https://adilsoybali.com/#contact" target="_blank"><img align="center" src="https://img.shields.io/badge/adilsoybali.com-448cec?style=for-the-badge&logo=koding&logoColor=white" alt="Personal Web Site" /></a>
</p>

## Acknowledgments

-   [Seccops](https://seccops.com/)
-   [LunaSec](https://www.lunasec.io/docs/blog/log4j-zero-day/)
-   [Zsolt Háló](https://github.com/zsolt-halo)

## Stargazers over time

[![Stargazers over time](https://starchart.cc/adilsoybali/Log4j-RCE-Scanner.svg?)](https://starchart.cc/adilsoybali/Log4j-RCE-Scanner)
