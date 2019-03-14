#!/bin/bash
#
# Sample deploy hook reloading Hitch after a Certbot update.
#
# Symlink or copy this file into /etc/letsencrypt/renewal-hooks/deploy/ to enable.
#
# Full path to pre-generated Diffie Hellman Parameters file
dhparams=/etc/hitch/dhparams

if [[ "${RENEWED_LINEAGE}" == "" ]]; then
    echo "Error: missing RENEWED_LINEAGE env variable." >&2
    exit 1
fi

umask 077
cat ${RENEWED_LINEAGE}/privkey.pem \
    ${RENEWED_LINEAGE}/fullchain.pem \
    ${dhparams} > ${RENEWED_LINEAGE}/hitch-bundle.pem

if [ $(systemctl --quiet is-active hitch.service) ]; then
    /bin/systemctl --quiet reload hitch.service
fi
