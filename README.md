# Instalação do Caddy Script 💻

Este é um script Bash para instalar o Caddy em um sistema Ubuntu. Ele instala as dependências necessárias, adiciona a chave GPG do repositório do Caddy e instala o Caddy em si.

## Como usar o script

1. Faça o download do script `install_caddy.sh`.
2. Abra o terminal e navegue até o diretório onde o script está localizado.
3. Execute o comando `sudo chmod +x install_caddy.sh` para tornar o script executável.
4. Execute o script com o comando `sudo ./install_caddy.sh`.
5. Siga as instruções no terminal para instalar o Caddy.

## Recursos

- Verifica se o comando `sudo` está disponível para garantir a execução do script com privilégios de sudo.
- Instala as dependências necessárias, incluindo `debian-keyring`, `debian-archive-keyring`, `apt-transport-https` e `gpg`.
- Adiciona a chave GPG do repositório do Caddy usando o comando `gpg`.
- Adiciona o repositório do Caddy e atualiza a lista de pacotes.
- Instala o Caddy usando o comando `apt-get install`.
- Fornece mensagens de status durante a execução do script.

## Observações

- Certifique-se de executar o script com privilégios de sudo.
- O script foi testado em sistemas Ubuntu, mas pode ser adaptado para outras distribuições do Linux.
- Sempre verifique a fonte dos scripts antes de executá-los em seu sistema.

Espero que este script seja útil para instalar o Caddy em seu sistema Ubuntu! 🚀
