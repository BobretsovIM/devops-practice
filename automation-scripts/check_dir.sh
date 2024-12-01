#!/bin/bash


directory=$1

# Обрабатываем ошибку на не существующию директорию.
if [ $# -eq 0 ]; then
	echo "Ошибка укажите директорию как аргумент."
	echo "Пример: $0 <директория>"
	exit 1
# Переменая "count" считает количество файлов в диретории.
else
	echo "$directory существует!"
        count=$(ls -l $directory | wc -l)
        echo "В директории $directory содержится $count файлов."
fi
