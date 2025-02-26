PATH=/opt/plesk/node/21/bin/:$PATH;

export $(xargs < .env.production)

HUSKY=0 yarn > yarn-install.log 2>&1

tsc src/main.ts

pm2 restart build/main.js || pm2 start build/main.js
