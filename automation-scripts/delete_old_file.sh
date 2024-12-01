#!/bin/bash

# Запрашиваем директорию у пользователя.
read -p "Введите директорию: " directory

# Проверить существует ли директория
if [ ! -d $directory ]; then
	echo "Ошибка: диреткории не существует."
	exit 1
fi

# Сохраняет в переменную поиск файлов старще 7 дней.
find_old_file=$(find "$directory" -mtime +7)

# Проверить существуют ли файлы старше 7 дней.
if [ -z "$find_old_file" ]; then
	echo "Нет файлов старше 7 дней."
	exit 0
else
	echo "Файлы старше 7 дней."
	echo "$find_old_file"
fi

# Запрашиваем у пользователя y/n
read -p "Желаете их удалить (y/n)?: " del_file

# Проверить ввод от пользователя y/n
if [ $del_file == "y" ]; then
	echo "Удаляем файлы."
	# Цикл: Пройти по каждому файлу и удалить его
	echo "$find_old_file" | while read file; do
		rm "$file" && echo "Удален: $file"
	done
else
	echo "Файлы не удалены."
fi
