FROM alpine:3.4

MAINTAINER <oss@wescale.fr>

RUN apk update && apk upgrade &&\
    apk add bash sudo git py-setuptools python-dev libffi-dev openssl-dev gcc musl-dev &&\
    easy_install-2.7 pip &&\
    pip install -U pyopenssl ndg-httpsclient pyasn1 ansible pywinrm &&\
    apk del gcc musl-dev libffi-dev python-dev openssl-dev --purge &&\
    adduser ansible -D -G wheel -s /bin/bash &&\
    sed -i -e "s/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers

ENV ANSIBLE_HOST_KEY_CHECKING False

USER ansible
WORKDIR /home/ansible

ENTRYPOINT ["/bin/bash"]
