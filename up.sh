#!/bin/bash
. env.sh
[[ -z "${USER}" ]] && { echo "missing USER"; exit 1; }
[[ -z "${UID}" ]] && { echo "missing UID"; exit 1; }
[[ -z "${PASSWORD}" ]] && { echo "missing PASSWORD"; exit 1; }
[[ -z "${SSH_PORT}" ]] && { echo "missing SSH_PORT"; exit 1; }
export CONTAINER=x2go-${USER}
docker kill ${CONTAINER}
docker container rm ${CONTAINER}
docker run -d=false --rm \
    --name ${CONTAINER} -p ${SSH_PORT}:22 -itd \
    --env="USER=${USER}" \
    --env="ID=${ID}" \
    --env="PASSWORD=${PASSWORD}" \
    --env="DISPLAY" \
    --env="QT_X11_NO_MITSHM=1" \
    --hostname $(hostname) \
    --volume="/tmp/.X11-unix:/tmp/.X11-unix:rw" \
    --volume="/home/${USER}:/home/${USER}:rw" \
    x2go
