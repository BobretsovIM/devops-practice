#!/bin/bash

# Переменная <status_procces> для хранении команды "провреки статуса".
# Переменная <active_service> для хранения вывода статуса сервиса.
# Функция <install_nginx> проверяет сущетсвует сервис, если да то выводит статус,
# если нет: устанавливает, проверяет если сервис не запущен, запустить.
status_procces=$(systemctl is-active nginx)
active_service=$(systemctl status nginx | grep "Active")

install_nginx() {

	if [ "$status_procces" == "active" ]; then
		echo "Сервис NGINX устрановлен"

	else 
        	echo "Запускаю установку NGINX"
        	sudo apt update
        	sudo apt install -y nginx

		if [ "$status_procces" == "inactive" ]; then
                	sudo systemctl start nginx
		fi
	fi
	
	echo "NGINX готов к работе!"
	sudo systemctl status nginx
}


install_nginx



