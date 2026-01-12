```markdown

# Custom Kinoite AMD

[![bluebuild build badge](https://github.com/jbdsjunior/kinoite-amd/actions/workflows/build.yml/badge.svg)](https://github.com/jbdsjunior/kinoite-amd/actions/workflows/build.yml)

Imagem personalizada do Fedora Kinoite, otimizada para processadores **AMD**, **Virtualização (KVM/Libvirt)** e **Multimídia**.

## 🚀 Instalação

Para migrar de uma instalação existente do Fedora Kinoite/Silverblue para esta imagem:

### 1. Rebase inicial (Unsigned)
Primeiro, mude para a imagem não assinada para importar as chaves corretamente:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/jbdsjunior/kinoite-amd:latest

```

Reinicie o sistema:

```bash
systemctl reboot

```

### 2. Ativar Verificação (Signed)

Após reiniciar, mude para a versão assinada para garantir a segurança e atualizações futuras:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/jbdsjunior/kinoite-amd:latest

```

## 🛠️ Pós-Instalação (Essencial)

Esta imagem contém scripts de automação para configurar grupos de usuários e otimizações de disco (BTRFS NoCOW) para máquinas virtuais.

Após o primeiro boot, abra o terminal e execute:

```bash
just setup-kvm

```

Isso irá configurar:

* Adição do seu usuário aos grupos `libvirt` e `kvm`.
* Criação e otimização das pastas de imagens (`/var/lib/libvirt/images`).

## 🔄 Como Reverter (Undo)

Se precisar voltar para o Fedora Kinoite padrão:

```bash
rpm-ostree rebase fedora:fedora/43/x86_64/kinoite

```

*(Substitua `43` pela versão atual do Fedora se necessário)*

## 🔐 Verificação Manual

Para verificar a assinatura da imagem localmente usando `cosign`:

```bash
cosign verify --key cosign.pub ghcr.io/jbdsjunior/kinoite-amd

```

```

```
