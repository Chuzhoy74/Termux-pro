#!/bin/bash

# Обновление и установка зависимостей
echo "Обновление пакетов и установка зависимостей..."
pkg update -y
pkg upgrade -y

# Установка необходимых пакетов
echo "Установка пакетов..."
pkg install git -y
pkg install python -y
pkg install curl -y
pkg install wget -y
pkg install unzip -y

# Проверка на наличие git
if ! command -v git &> /dev/null
then
    echo "git не найден, установка..."
    pkg install git -y
else
    echo "git уже установлен."
fi

# Проверка на наличие Python
if ! command -v python &> /dev/null
then
    echo "Python не найден, установка..."
    pkg install python -y
else
    echo "Python уже установлен."
fi

# Проверка на наличие curl
if ! command -v curl &> /dev/null
then
    echo "curl не найден, установка..."
    pkg install curl -y
else
    echo "curl уже установлен."
fi

# Клонирование репозитория (замени ссылку на свой репозиторий)
echo "Клонирование репозитория..."
git clone https://github.com/твой-ник-нейм/Termux-Pro.git

# Переход в директорию проекта
cd Termux-Pro

# Запуск установки или других скриптов
if [ -f "install.sh" ]; then
    echo "Запуск install.sh..."
    chmod +x install.sh
    ./install.sh
else
    echo "Файл install.sh не найден в репозитории."
fi

# Завершение
echo "Установка завершена!"
