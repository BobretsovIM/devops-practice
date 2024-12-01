#!/bin/bash

# Записываем путь хранения backup в переменую.
way=/home/$USER/backup/

# Запрос директории для резерного копирования.
read  -p "Введите диреткорию: " directory
if [ -z "$directory" ]; then
  echo "Ошибка: Директория не указана."
  exit 1
fi

if [ ! -e $directory ]; then
	echo "Ошибка: $directory не существует."
	exit 1
fi

# Архивация с жатием
echo "Начинаю процесс архивации файла." 
tar -czvf backup_$(date "+%d-%m-%Y").tar.gz -P $directory
echo "Процесс заверншен."

# Проверяем есть ли данный каталог, если его нет, то создаем.
if [ ! -d $way ];then
	mkdir $way

  	# Переносим архив в директорию "way".
        mv backup_$(date "+%d-%m-%Y").tar.gz $way
        echo "Диреткория архива: $way"
else
        mv backup_$(date "+%d-%m-%Y").tar.gz $way
        echo "Директория архива: $way"

        
fi
