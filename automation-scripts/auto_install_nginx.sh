#!/bin/bash

# Переменная <status_procces> для хранении команды "провреки статуса".

# Функция <install_nginx> проверяет сущетсвует сервис, если да то выводит статус,
# если нет: устанавливает, проверяет если сервис не запущен, запустить.
install_nginx() {
    status_procces=$(systemctl is-active nginx)

    if [ "$status_procces" == "active" ]; then
        echo "Сервис NGINX уже установлен и работает."

    else
        echo "Запускаю установку NGINX..."
        sudo apt update
        sudo apt install -y nginx

        # Если сервис не запущен, запускаем его
        if [ "$status_procces" == "inactive" ] || [ "$status_procces" == "failed" ]; then
            echo "Запускаю сервис NGINX..."
            sudo systemctl start nginx
        fi
    fi
    
    # Выводим информацию о статусе NGINX после установки или запуска
    echo "NGINX готов к работе!"
    sudo systemctl status nginx
}

install_nginx



