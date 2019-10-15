FROM ubuntu:16.04

MAINTAINER im@mxp.tw

RUN apt-get -o Acquire::ForceIPv4=true update
RUN apt-get upgrade -y

RUN apt-get install software-properties-common python-software-properties  -y
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:nginx/stable
RUN apt-get -o Acquire::ForceIPv4=true update
RUN apt-get upgrade -y
RUN apt-get install -y software-properties-common
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN export LANG=C.UTF-8
RUN apt-get -o Acquire::ForceIPv4=true update
RUN apt-get upgrade -y
RUN apt-get install nano wget git vim openssh-server supervisor -y
RUN mkdir -p /var/log/supervisor

# Setup SSH
RUN echo 'root:root' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
RUN mkdir /var/run/sshd && chmod 0755 /var/run/sshd
RUN mkdir -p /root/.ssh/
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd
ADD access.key.pub  /root/.ssh/authorized_keys

EXPOSE 22

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
