# Custom Kinoite (AMD Edition)

[![build-ublue](https://github.com/jbdsjunior/kinoite-amd/actions/workflows/build.yml/badge.svg)](https://github.com/jbdsjunior/kinoite-amd/actions/workflows/build.yml)

Imagem personalizada do **Fedora Kinoite**, otimizada para processadores **AMD Ryzen**, **Virtualização (KVM/Libvirt)** e **Multimídia**.

### ✨ Destaques
* **AMD Otimizado:** Argumentos de kernel (`kargs`) para melhor performance e IOMMU.
* **Virtualização Pronta:** KVM, QEMU, Libvirt e Virt-Manager pré-instalados e configurados.
* **Multimídia:** Codecs RPM Fusion (FFmpeg, GStreamer) incluídos.
* **Gaming/Tools:** Suporte a controles, Steam (via Flatpak) e ferramentas de sistema.

---

## 🚀 Instalação

Abra o terminal e siga os passos para migrar do Fedora Kinoite padrão para esta imagem.

### 1. Rebase Inicial (Importação de Chaves)
Mude para a imagem não assinada temporariamente:

```bash
rpm-ostree rebase ostree-unverified-registry:ghcr.io/jbdsjunior/kinoite-amd:latest

```

### 2. Ativar Verificação (Segurança)

Após reiniciar, mude para a versão assinada para garantir atualizações seguras:

```bash
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/jbdsjunior/kinoite-amd:latest
systemctl reboot

```

---

## 🛠️ Pós-Instalação (Essencial)

Para finalizar a configuração de permissões de virtualização e otimização de disco (BTRFS NoCOW), execute:

```bash
just setup-kvm
systemctl reboot
```

> **O que isso faz?** Adiciona seu usuário aos grupos `libvirt/kvm` e cria a pasta de VMs com atributos de performance otimizados.

---

## 🔄 Como Reverter

Se precisar voltar para o Fedora Kinoite padrão:

```bash
rpm-ostree rebase fedora:fedora/$(rpm -E %fedora)/x86_64/kinoite
systemctl reboot

```

## 🔐 Verificação Manual (Opcional)

Para verificar a assinatura da imagem localmente:

```bash
cosign verify --key cosign.pub ghcr.io/jbdsjunior/kinoite-amd

```
