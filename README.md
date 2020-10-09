### OpenSIS Docker Image based on Debian LAMP 

This is a working docker image for [OpenSIS Responsive Design](https://github.com/OS4ED/openSIS-Responsive-Design) based on Debian and using Apache2.

## Build Instructions

* Clone the git repo 

* Execute `docker build . -t opensis`

* Start with `docker run -d --name opensis -p8080:80 opensis`

* Point a browser to localhost:8080


