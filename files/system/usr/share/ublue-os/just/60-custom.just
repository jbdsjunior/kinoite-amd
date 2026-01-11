# Comandos de Pós-Instalação Local (Coisas que a imagem não pode fazer)

setup-local:
    @echo ">> Configurando Permissões e Diretórios Locais..."
    # Grupos de Usuário
    sudo usermod -aG libvirt,kvm,input $USER

    # Otimização BTRFS (NOCOW) para VMs
    sudo mkdir -p /var/lib/libvirt/images
    sudo chattr +C /var/lib/libvirt/images 2>/dev/null || true
    mkdir -p ~/.local/share/libvirt/images
    chattr +C ~/.local/share/libvirt/images 2>/dev/null || true

    @echo ">> Tudo pronto! Reinicie ou faça logout."