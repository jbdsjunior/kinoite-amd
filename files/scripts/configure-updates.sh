#!/bin/sh
# Define a política para baixar atualizações em segundo plano (Stage)
# O padrão 'check' apenas notifica, mas não prepara o sistema.

sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
sed -i 's/AutomaticUpdatePolicy=check/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
sed -i 's/AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf

# Opcional: Permitir atualização mesmo se o PC não estiver ocioso
sed -i 's/^#IdleExitTimeout=60/IdleExitTimeout=60/' /etc/rpm-ostreed.conf