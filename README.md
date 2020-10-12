# OCR Projet 03 Docker

Construire avec Docker un conteneur Debian 10 avec Nginx et OpenSSH.

## Prérequis

- Docker v19+

## Installation

1. Cloner le projet et se déplacer dans son répertoire :

    ```shell
    git clone https://github.com/jnuxyz/ocr_projet_03_docker.git
    cd ocr_projet_03_docker
    ```

2. Construire l'image Docker **ocr_env** à partir du Dockerfile <small>*(modifier \<PASSWORD>)*</small> :

    ```shell
    docker build -t ocr_env . --build-arg ROOT_PASSWORD="<PASSWORD>"
    ```

3. Lister les images Docker :

    ```shell
    docker images
    ```

4. Exécuter le conteneur Docker **envOcr** :

    ```shell
    docker run -d -p 8080:80 -p 2022:22 --name envOcr ocr_env
    ```

5. Lister les conteneurs Docker en cours d'exécution :

    ```shell
    docker ps
    ```

## Utilisation

1. Accéder aux services :

   * Sur la machine virtuelle :
        * `ssh root@localhost -p 2022`
        * `curl localhost:8080`

   * Sur la machine hôte :
        * `ssh root@192.168.66.6 -p 2022`
        * Navigateur web : [http://192.168.66.6:8080](http://192.168.66.6:8080)  

2. Arrêter le conteneur Docker **envOcr** en cours d'exécution :

    ```shell
    docker stop envOcr
    ```

3. Lister tous les conteneurs Docker :

    ```shell
    docker ps -a
    ```

4. Nettoyage :

    * Supprimer le conteneur Docker **envOcr**:
        ```shell
        docker rm envOcr
        ```

    * Supprimer l'image Docker **ocr_env**:
        ```shell
        docker image rm ocr_env
        ```

Pour voir toutes les commandes Docker : `docker --help` ou voir la [documentation Docker](https://docs.docker.com/engine/reference/commandline/docker/).  
