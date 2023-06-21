#!/bin/bash

function check_package() {
    dpkg -s "$1" >/dev/null 2>&1
}

function check_command() {
    command -v "$1" >/dev/null 2>&1
}

function install_package() {
    local package=$1
    if check_package "$package"; then
        echo "$package já está instalado."
    else
        echo "Instalando $package..."
        sudo apt-get -y install "$package"
        echo "Instalação de $package concluída."
    fi
}

# Verifique se o comando sudo está disponível
if ! check_command sudo; then
    echo "Erro: 'sudo' não encontrado. Este script deve ser executado com privilégios de sudo."
    exit 1
fi

# Instale as dependências necessárias
install_package "debian-keyring"
install_package "debian-archive-keyring"
install_package "apt-transport-https"
install_package "gpg"

# Adicione a chave GPG
if check_command "gpg"; then
    echo "Adicionando a chave GPG..."
    curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/gpg.key' | sudo gpg --dearmor -o /usr/share/keyrings/caddy-stable-archive-keyring.gpg
    if [ $? -ne 0 ]; then
        echo "Falha na adição da chave GPG. Saindo..."
        exit 1
    fi
else
    echo "O comando gpg não está disponível. Saindo..."
    exit 1
fi

# Adicione o repositório e atualize
echo "Adicionando o repositório e atualizando..."
curl -1sLf 'https://dl.cloudsmith.io/public/caddy/stable/debian.deb.txt' | sudo tee /etc/apt/sources.list.d/caddy-stable.list
sudo apt update
if [ $? -ne 0 ]; then
    echo "Falha na adição do repositório ou na atualização. Saindo..."
    exit 1
fi

# Instale o Caddy
install_package "caddy"

echo "Caddy instalado com sucesso!"
