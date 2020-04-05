# HIREABLES 🍔

## prerequisites

- [brew](https://brew.sh/) ([MacOS](https://brew.sh/) | [Linux](https://docs.brew.sh/Homebrew-on-Linux))
- [ruby](https://www.ruby-lang.org/)
- [node](https://nodejs.org/)
- [yarn](https://classic.yarnpkg.com/)

## setup

```sh
brew bundle install --no-lock
heroku login
heroku config:get RAILS_MASTER_KEY --app hireables-production > config/master.key
docker-compose up
bin/setup
```

## day to day

```sh
docker-compose up
bin/webpack-dev-server
bundle exec rails s
```
