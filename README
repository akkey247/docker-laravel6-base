# 使い方

## 環境構築

### 1. コンテナのビルド＆起動

```
$ docker-compose up -d --build
```

### 2. コンテナに入る

```
$ docker-compose exec php bash
```

### 3. Laravel プロジェクト作成

```
/var/www# composer create-project --prefer-dist laravel/laravel=5.8.* .
```

### 4. Laravel の DB 設定変更

`myapp/.env` を修正する。

```
DB_CONNECTION=mysql
DB_HOST=db-host
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel-user
DB_PASSWORD=laravel-pass
```

### 5. マイグレーション

```
/var/www# php artisan migrate
```

## 環境構築後

### コンテナを起動する

```
$ docker-compose up -d
```

### コンテナを停止する

```
$ docker-compose down
```

### コンテナを停止＆イメージ削除

```
$ docker-compose down --rmi all --volumes
```

# 参考記事

[docker で Laravel 環境構築](https://qiita.com/rope19181/items/10da72374839630af83b)
