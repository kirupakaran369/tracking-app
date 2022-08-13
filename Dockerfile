FROM ubuntu:20.04

RUN  apt update -y

RUN apt install curl -y

RUN  apt install software-properties-common ca-certificates lsb-release apt-transport-https -y

RUN  LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y 

RUN  apt update -y

RUN  apt install php7.4 -y

RUN  apt-get install php7.4-cli php7.4-fpm php7.4-bcmath php7.4-curl php7.4-gd php7.4-intl php7.4-json php7.4-mbstring php7.4-mysql php7.4-opcache php7.4-sqlite3 php7.4-xml php7.4-zip -y

RUN curl -sS https://getcomposer.org/installer -o composer-setup.php 

RUN   php composer-setup.php --install-dir=/usr/local/bin --filename=composer -y

RUN  apt install sqlite3 -y 

RUN apt-get install build-essential -y

RUN apt-get -y install make

WORKDIR /majordome 

COPY . /majordome

RUN cd /majordome

CMD ["make", "install"] 

EXPOSE 8080



