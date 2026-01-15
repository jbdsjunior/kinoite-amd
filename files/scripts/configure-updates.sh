#!/bin/sh

# Garante que a política seja 'stage' (baixar e preparar)
# O padrão costuma ser 'none' ou 'check'
sed -i 's/^AutomaticUpdatePolicy=.*/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf || \
sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf

# Opcional: Permitir atualização mesmo se o PC não estiver ocioso
sed -i 's/^#IdleExitTimeout=60/IdleExitTimeout=60/' /etc/rpm-ostreed.conf