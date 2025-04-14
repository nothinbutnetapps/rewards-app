# README

## How to run the app

Make sure you have a .env in the root directory providing the DATABASE_URL. If you use the url I've provided then it will be linked to a DB in a Supabase project, so there's no need to spin up a local db instance.

Just run the following:
1. `npm install`
2. `bundle install`
3. `./bin/dev`

Then go to http://127.0.0.1:3000/

## Using the app

A new user is created the first time using the app and is stored to localstorage. If you want to try it with another user, just open the app in a new incognito window.
