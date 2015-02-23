FROM gliderlabs/alpine:3.1

MAINTAINER <oss@wescale.fr>

RUN apk update && apk upgrade &&\
    apk-install bash sudo ansible py-boto &&\
    adduser ansible -D -G wheel -s /bin/bash &&\
    sed -i -e "s/# %wheel ALL=(ALL) NOPASSWD: ALL/%wheel ALL=(ALL) NOPASSWD: ALL/g" /etc/sudoers &&\
    mkdir /etc/ansible &&\
    echo "[local]" >> /etc/ansible/hosts &&\
    echo "127.0.0.1 ansible_connection=local" >> /etc/ansible/hosts

ENV ANSIBLE_HOST_KEY_CHECKING False

USER ansible
WORKDIR /home/ansible

ENTRYPOINT ["/bin/bash"]