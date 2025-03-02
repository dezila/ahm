#!/bin/bash

# Отключение UFW, если он установлен
echo "Отключаем UFW..."
ufw disable

# Установка 3x-ui с автоматическим ответом "n" на запрос настройки порта
echo "Устанавливаем 3x-ui..."
bash <(curl -Ls https://raw.githubusercontent.com/MHSanaei/3x-ui/master/install.sh) <<< "n"

# Установка TPM в текущую директорию
echo "Скачиваем и устанавливаем TPM..."
wget https://github.com/IcyHenryT/TPM-Loader/releases/latest/download/TPM-loader-linux && chmod +x TPM-loader-linux

# Загрузка пользовательского конфига в текущую директорию
echo "Загружаем конфигурацию..."
wget -O "config.json5" "https://raw.githubusercontent.com/dezila/ahm/refs/heads/main/config.json5"

echo "Установка завершена. Данные о 3x-ui:"
x-ui settings
