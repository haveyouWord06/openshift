#!/bin/sh
# V2Ray new configuration
UUID=3bf7d881-26ce-4488-96ad-e3c9040fe400
WSPATH=/vless
PORT=80

cat <<-EOF > /etc/v2ray/config.json
{
  "inbounds": [
    {
      "port": ${PORT},
      "protocol": "vless",
      "settings": {
        "clients": [
          {
            "id": "${UUID}"
          }
        ],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "wsSettings": {
          "path": "${WSPATH}"
        }
      }
    }
  ],
  "outbounds": [
    {
      "protocol": "freedom"
    }
  ]
}
EOF
# Run V2Ray
/usr/bin/v2ray/v2ray -config=/etc/v2ray/config.json
