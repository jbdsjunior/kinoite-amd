#!/bin/sh

sed -i 's/#AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
sed -i 's/AutomaticUpdatePolicy=check/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf
sed -i 's/AutomaticUpdatePolicy=none/AutomaticUpdatePolicy=stage/' /etc/rpm-ostreed.conf

sed -i 's/^#IdleExitTimeout=60/IdleExitTimeout=60/' /etc/rpm-ostreed.conf