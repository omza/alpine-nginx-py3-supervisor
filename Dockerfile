# diboards.base image
# alpine 3.5
# python 3.6
# nginx stable
# Supervisor py3k (dev version)

FROM nginx:stable-alpine
MAINTAINER oliver@app-workshop.de

# ARGs & ENVs
# -------------------------------------------------------

# Dirs & Copy Context
# -------------------------------------------------------

COPY .supervisord.conf /etc/supervisor/supervisord.conf

# Volumes
# -------------------------------------------------------
VOLUME /var/log/
VOLUME /usr/share/nginx/html/


# Python
# --------------------------------------------------------
RUN apk add --no-cache python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    rm -r /root/.cache

# Supervisor py3k (dev version)
# ---------------------------------------------------------
RUN apk update && \
    apk upgrade && \
    apk add -u git && \
	pip install --no-cache-dir setuptools-git && \
	pip install --no-cache-dir git+https://github.com/orgsea/supervisor-py3k.git

# Start & Stop
# -----------------------------------------------------------
EXPOSE 80 443

STOPSIGNAL SIGTERM

ENTRYPOINT ["supervisord", "--nodaemon"]
