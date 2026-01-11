#!/usr/bin/env bash

# Diga ao sistema para parar se houver erro
set -ouex pipefail

echo ">> Executando ajustes pós-instalação da Imagem..."

# Exemplo: Se você precisar garantir que o libvirtd tenha o grupo correto no sistema (opcional, pois o pacote já faz isso)
# getent group libvirt >/dev/null || groupadd -r libvirt

# Exemplo: Habilitar serviços que o módulo systemd do YAML não cobriu (opcional)
systemctl enable libvirtd

# Limpeza de cache do dnf para diminuir o tamanho da imagem
dnf clean all
