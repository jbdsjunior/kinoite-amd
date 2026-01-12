# Configura permissões e otimizações para Virtualização (KVM/Libvirt)
setup-kvm:
    @echo ">> [1/4] Configurando Grupos de Usuário..."
    sudo usermod -aG libvirt,kvm $USER
    @echo ">> [2/4] Otimizando diretório de imagens do sistema (NOCOW)..."
    # O diretório precisa existir e de preferência estar vazio para o atributo funcionar perfeitamente
    [ -d /var/lib/libvirt/images ] || sudo mkdir -p /var/lib/libvirt/images
    sudo chattr +C /var/lib/libvirt/images
    @echo ">> [3/4] Criando e otimizando diretório local de imagens..."
    mkdir -p ${HOME}/.local/share/libvirt/images
    chattr +C ${HOME}/.local/share/libvirt/images
    @echo ">> [4/4] Concluído! Reinicie o PC para aplicar os grupos."