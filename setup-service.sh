#!/bin/bash
HERE=$(realpath .)
cat >x2go.service <<EOF
[Unit]
Description=X2Go Session

[Service]
ExecStart=/bin/bash -c "cd ${HERE} && ./up.sh"

[Install]
WantedBy=default.target
EOF
mkdir -p ~/.config/systemd/user
ln -sf ${HERE}/x2go.service ~/.config/systemd/user/x2go.service
systemctl --user daemon-reload
systemctl --user enable x2go
systemctl --user start x2go
