#!/usr/bin/env sh

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# if you are deploying to a custom domain
echo 'donecca.pigjackey.com' > CNAME

git init
git add -A
git commit -m 'deploy'

# if you are deploying to https://<USERNAME>.github.io
#git push -f git@github.com:pigjackey/pigjackey.github.io.git master
git push -f ssh://pigjacke@pigjackey.com/home/pigjacke/donecca.pigjackey.com master

# if you are deploying to https://<USERNAME>.github.io/<REPO>
# git push -f git@github.com:<USERNAME>/<REPO>.git master:gh-pages

cd -

#5lTt?8)ypd92
#72B$RnPptJF4