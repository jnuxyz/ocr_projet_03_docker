FROM debian:buster

RUN apt-get update \
    && apt-get install -y \
        nginx openssh-server
        
RUN mkdir /var/run/sshd
RUN echo 'root:toor' | chpasswd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

RUN echo "daemon off;" >> /etc/nginx/nginx.conf
        
EXPOSE 22 80

CMD service ssh start && service nginx start
