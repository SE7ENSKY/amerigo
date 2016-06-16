#!/bin/bash

npm install ; verstat -e static generate
mkdir tmp
(cd tmp; git clone --depth 1 https://github.com/SE7ENSKY/heroku-template-static.git)
mkdir tmp-deploy
cp tmp/heroku-template-static/composer.json tmp-deploy/
cp tmp/heroku-template-static/apache_app.conf tmp-deploy/
cp tmp/heroku-template-static/nginx_app.conf tmp-deploy/
cp tmp/heroku-template-static/Procfile tmp-deploy/
cp -r out tmp-deploy/public
cd tmp-deploy
git init
git add -A
git commit -m 'auto deploy2dokku'
git remote add dokku dokku@app.nsg.agency:amerigo
git push -f dokku master
cd ..
rm -rf tmp
rm -rf tmp-deploy