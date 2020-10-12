# Défini l'image utiliser comme base
FROM debian:buster

# Définit la variable passer au moment de la construction
# --build-arg ROOT_PASSWORD="<PASSWORD>"
ARG ROOT_PASSWORD

# Met à jour les depôts et installe nginx et openssh-server
RUN apt-get update \
    && apt-get install -y \
        nginx openssh-server

# Défini le mot de passe de l'utilisateur 'root' avec la variable ROOT_PASSWORD
RUN echo 'root:'$ROOT_PASSWORD | chpasswd

# Configuration du serveur SSH pour autoriser l'utilisateur 'root' à se connecter avec un mot de passe
RUN mkdir /var/run/sshd
RUN sed -i 's/#*PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
RUN sed -i 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' /etc/pam.d/sshd
ENV NOTVISIBLE="in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile
        
# Indique les ports sur lesquels le conteneur écoute les connexions
EXPOSE 22 80

# Spécifie la commande à exécuter dans le conteneur
# Démarre le service 'ssh' et configure 'Nginx' pour qu'il fonctionne en premier plan
CMD ["/bin/bash", "-c", "/usr/sbin/service ssh start && nginx -g 'daemon off;'"]
