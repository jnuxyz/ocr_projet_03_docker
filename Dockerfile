FROM debian:buster

RUN apt-get update \
    && apt-get install -y \
        nginx openssh-server
        
RUN echo 'root:password' | chpasswd

RUN mkdir /var/run/sshd

RUN sed 's/PermitRootLogin without-password/PermitRootLogin yes/' -i /etc/ssh/sshd_config
        
EXPOSE 22 80

CMD service ssh start && nginx -g 'daemon off;'
