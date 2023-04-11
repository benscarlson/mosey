setopt interactivecomments
bindkey -e

cd ~/projects/mosey

rm -rf src

git clone git@github.com:benscarlson/mosey.git src

mv src/docs/* . #Need to remove everything from docs to create jekyll

jekyll new --skip-bundle .

# Edit Gemfile

bundle install
#https://github.com/jekyll/jekyll/issues/8523
bundle add webrick

#---- Run jekyll ----

cd ~/projects/mosey/src

#Seems jekyll serve does all the parsing before serving the web page  
bundle exec jekyll serve

#rename index.markdown -> index.markdown.old
#remove the entry from the _posts directory
#Moved everything out of docs and up a level into src
#Put assets/images into docs

#Go to http://localhost:4000