#!/bin/bash

# Запрашиваем у пользователя имя процесса
read -p "Введите имя процесса (пример: nginx): " name_procces

# Проверяем, активен ли процесс
status_procces=$(systemctl is-active "$name_procces")

if [ "$status_procces" == "active" ]; then
    echo "Процесс '$name_procces' запущен."

    # Получаем информацию о PID и использовании памяти
    pid_procces=$(systemctl show "$name_procces" --property=MainPID | cut -d= -f2)
    memory_procces=$(systemctl show "$name_procces" --property=MemoryCurrent | cut -d= -f2)

    echo "Информация:"
    echo "PID процесса: $pid_procces"
    if [ -n "$memory_procces" ]; then
        echo "Потребление памяти: $memory_procces байт"
    else
        echo "Данные о памяти недоступны."
    fi
else
    echo "Процесс '$name_procces' не запущен или не существует."
fi
