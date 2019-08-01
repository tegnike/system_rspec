# System Spec 導入

## 1. 以下のファイルを作成

- Dockerfile
- docker-compose.yml
- Gemfile
- Gemfile.lock

DockerfileでGoogle Chromeのインストールを実行

## 2. Rails Projectを作成

```
$ docker-compose run web rails new . --force --database=postgresql --skip-test
```

## 3. 必要なgemを追記して再build

- rspec-rails
- capybara
- selenium-webdriver
- webdrivers
- launchy

```
$ docker-compose build
```

## 4. DBを作成

database.ymlを修正

```
$ docker-compose run web rake db:create
```

## 5. User modelを作成

```
$ docker-compose run web bin/rails g scaffold User name:string
$ docker-compose run web rake db:migrate
```

## 6. System Specを導入

```
$ rails generate rspec:install
```

`rails_helper.rb` に `require 'capybara/rspec'` を追記  
`system/user_spec.rb` に最低限のテストを記載

## 7. コンテナを起動してテスト

```
$ docker-compose up
$ docker-compose run web bin/rails spec
```
