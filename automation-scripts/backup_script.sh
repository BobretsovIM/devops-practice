#!/bin/bash

# Переменная для хранения пути к бэкапам
backup_dir="/home/$USER/backup/"

# Запрос директории для резервного копирования
read -p "Введите директорию для резервного копирования: " directory

# Проверка, указана ли директория
if [ -z "$directory" ]; then
  echo "Ошибка: Директория не указана."
  exit 1
fi

# Проверка существования директории
if [ ! -d "$directory" ]; then
  echo "Ошибка: Директория $directory не существует."
  exit 1
fi

# Имя архива
archive_name="backup_$(date "+%d-%m-%Y").tar.gz"

# Архивирование сжатием
echo "Начинаю процесс архивации директории $directory..."
tar -czvf "$archive_name" -P "$directory"
if [ $? -ne 0 ]; then
  echo "Ошибка: Архивирование завершилось с ошибкой."
  exit 1
fi
echo "Архивация завершена: $archive_name."

# Проверка и создание директории для хранения бэкапов
if [ ! -d "$backup_dir" ]; then
  echo "Целевая директория для бэкапов не существует. Создаю $backup_dir..."
  mkdir -p "$backup_dir"
fi

# Перемещение архива
echo "Перемещаю архив в $backup_dir..."
mv "$archive_name" "$backup_dir"
if [ $? -ne 0 ]; then
  echo "Ошибка: Не удалось переместить архив."
  exit 1
fi

echo "Резервное копирование завершено. Архив находится в $backup_dir."
