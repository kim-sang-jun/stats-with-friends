# stats-with-friends

A rails app that manages scores for:
- NYTimes Mini Crossword

## Dependencies

Ruby:

```sh
$ ruby --version
ruby 3.0.2p107 (2021-07-07 revision 0db68f0233) [x86_64-darwin19]
```

Postgres:
 
```sh
$ brew info postgresql
postgresql: stable 14.1 (bottled), HEAD
```

## Setup

Setup the databases:

```sh
$ bin/rails db:setup
Created database 'stats_with_friends'
Created database 'stats_with_friends_test'

$ bin/rails db:migrate
```

## Run

Run the application via: 

```sh
$ bin/rails server
```

## Configuration

There's a local `.env` for local/dev/test configuration:

```
POSTGRES_USER=''
POSTGRES_PASSWORD=''
POSTGRES_HOST='localhost'
POSTGRES_DB='stats_with_friends'
POSTGRES_TEST_DB='stats_with_friends_test'
```

## Tests

N/A 

## Deployment

Deployment is currently done via Heroku. Use the [heroku CLI](https://devcenter.heroku.com/articles/using-the-cli) to do things.

[Common rails commands on Heroku](https://devcenter.heroku.com/articles/getting-started-with-rails6#run-the-rails-console) can be run via:
```sh
$ heroku run rails db:migrate
```

Login to heroku:

```sh
$ heroku login
```

View your heroku apps:

```sh
$ heroku apps
```

Deploy a branch:

```sh
$ git push heroku <branch>
```

This deploys to the instance configured as that git origin:

```sh
$ cat .git/config
...
[remote "heroku"]
    url = https://git.heroku.com/mysterious-beyond-68698.git
    fetch = +refs/heads/*:refs/remotes/heroku/*
...
```


