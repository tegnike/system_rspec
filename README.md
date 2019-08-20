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
$ docker-compose run web rails generate rspec:install
```

`rails_helper.rb` に `require 'capybara/rspec'` を追記  
`system/user_spec.rb` に最低限のテストを記載

## 7. コンテナを起動してテスト

```
$ docker-compose up
$ docker-compose run web bin/rails spec
```

# 参考にしたURL

- [docker-compose で Rails の開発環境を作る](https://qiita.com/skyriser/items/2cf98b747ed6577cc5ee)
- [rspec-rails 3.7の新機能！System Specを使ってみた](https://qiita.com/jnchito/items/c7e6e7abf83598a6516d)
- [Docker内で Headless Chrome を起動してRSpecを動作させる方法](https://futurismo.biz/rails-capybara-rspec-within-docker/)
