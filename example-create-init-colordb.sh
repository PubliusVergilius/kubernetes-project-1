kubectl create configmap mongodb-init-colordb.js \
  --from-file=mongodb-init-colordb.js \
  --label app=mongodb
