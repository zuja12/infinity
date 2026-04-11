#!/bin/bash
export PINFINITY_PATH=/home/infinity
cd $PINFINITY_PATH
export PINFINITY_NAME=InfinityHans
export PINFINITY_EMAIL=Someone@hotmail.com
export PINFINITY_DEVICE_ID=98D331F340E60001
export PINFINITY_DEVICE_NAME=InfinityHans
export PINFINITY_SERIAL_NUMBER=JIR2021050068
echo Run entrypoint.sh
. $PINFINITY_PATH/entrypoint.sh
echo Run uvicorn
# uvicorn app.main:app --host 0.0.0.0 --port 8000&
uvicorn app.main:app --host 0.0.0.0 --port 443 --ssl-keyfile certs/key.pem --ssl-certfile certs/cert.pem&
# echo restart nginx
# systemctl start nginx
echo "System started"