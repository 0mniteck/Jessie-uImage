#!/bin/bash
snap remove docker --purge && snap install docker && sleep 10 && docker run --cpus=$(nproc) --rm --privileged multiarch/qemu-user-static --reset -p yes && docker build -t jessie . && docker run --cpus=$(nproc) --name jessie -it jessie bash -c /WORKBOOK.sh && docker cp jessie:/linux-4.9-4.9.210/uImage /root/uImage && mv /root/uImage uImage
