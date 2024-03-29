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
/var/www# composer create-project --prefer-dist laravel/laravel=6.* .
```

### 4. Laravel の DB 設定変更

`myapp/.env` を修正する。

```
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel
DB_USERNAME=laravel-user
DB_PASSWORD=laravel-pass
```

### 5. マイグレーション

```
/var/www# php artisan migrate
```

`php_network_getaddresses` エラーが出る場合は、DBのコンテナ名が `.env` の `DB_HOST` の値と違う名前で作られている可能性があるので、 `DB_HOST` の値にDBコンテナの名前を設定する。  

## laravel/ui + Bootstrap 4 導入手順

### 1. laravel/ui インストール

```
/var/www# composer require laravel/ui "1.x" --dev
```

### 2. bootstrap 4 インストール

```
/var/www# php artisan ui bootstrap
```

### 3. npm パッケージのインストール

```
/var/www# npm install
```

### 4. ビルドタスクを実行

```
/var/www# npm run dev
```

## 自動インストール

環境構築(3〜5) ＋ laravel/ui インストールを自動で実行する。  
コンテナ作成後、コンテナに入った状態で以下のコマンドを実行する。  

```
/var/www# install-laravel
```

|オプション|説明|
|---|---|
|--ui=TYPE|TYPEにはvue,react,bootstrapが指定できる|
|--auth|認証機能を追加する|
|-h, --help|ヘルプを表示する|
|-v, --version|コマンドのバージョンを表示する|

## 管理機能追加

### 1. laravel-admin インストール

以下のコマンドを実行する

```
/var/www# composer require encore/laravel-admin
```

```
/var/www# php artisan vendor:publish --provider="Encore\Admin\AdminServiceProvider"
```

```
/var/www# php artisan admin:install
```

### 2. ユーザー管理画面追加

```
/var/www# php artisan admin:make UserController --model=App\\User
```

### 3. app/Admin/routes.php にルーティング追加

以下のコードを追加

```
$router->resource('user', UserController::class);
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
