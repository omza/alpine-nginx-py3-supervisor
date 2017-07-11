# alpine-nginx-py3-supervisor

> A mimimized Image based on nginx:alpine-stable with python 3.6.1 and dev version of Supervisor py3k

This image is intended for the rapid development and deployment of a web service in just one container . The image contains the following packages:

- alpine 3.5
- python 3.6.1
- pip 9.0.1
- nginx 12.1
- [Supervisor py3k](https://github.com/lowcloudnine/supervisor-py3k) (dev version)


## Getting started

In your Dockerfile start with 
```
FROM omza/alpine-nginx-py3-supervisor
```

At runtime mount the Volumes for logfiles and the supervisord.conf file:
```
VOLUME /usr/log/
VOLUME /usr/conf/
```

## Usage example

I use this Image as a base for different Proof of concepts and showcases e.g. my [diboards projects](https://github.com/omza/diboards). The project setup in short is:

- nginx as reverse proxy
- gunicorn as webserver
- flask-restplus microframework/lib to provide a RESTful API 


## Meta

* **Oliver Meyer** - *app workshop UG (haftungsbeschränkt)* - [omza on github](https://github.com/omza)

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details