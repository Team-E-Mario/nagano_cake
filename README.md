# Nagano-cake

<img alt="Nagano-Caki-Logo0" src="https://user-images.githubusercontent.com/126536571/234309287-3bb5e30b-bd13-458f-a4ec-9ccdec86ca43.png">
<img alt="nagano_about1" src="https://user-images.githubusercontent.com/126536571/234310742-12055318-1dbb-44df-a787-e3db815d37c4.png">
<img width="1470" alt="スクリーンショット 2023-04-24 20 07 44" src="https://user-images.githubusercontent.com/126536571/233979357-305f3ee0-1344-4997-9e80-3b595668f6cc.png">

* [概要](#概要)
* [使用している言語フレームワークのバージョン](#使用している言語フレームワークのバージョン)
* [機能](#機能)
* [インストール方法](#インストール方法)
* [管理者ページのログインについて](#管理者ページのログインについて)

---

### メンバー
- かわちゃん
- あっくん
- クリボー

### 概要
長野県にある洋菓子店「ながのCAKE」の商品の通販を想定した、ECサイトを開発しました。<br>
※このECサイトはDMM WEB CAMP生によるチーム開発課題です。実在するお店のサイトではありませんのでご了承ください。

### 使用している言語フレームワークのバージョン
- ruby 3.1.2
- Rails 6.1.7.3
- Bootstrap v4.5.3

### 機能
- 顧客側
  - 会員登録、ログイン・ログアウト、退会
    - 会員情報の編集
  - カートへの追加、商品購入
    - 支払い方法、配送先の指定
  - 注文履歴の閲覧
- 管理者側
  - 商品の新規追加、編集、閲覧
    - 商品情報の編集
  - 会員登録されているユーザ情報の閲覧、編集、退会処理
    - ユーザの注文履歴閲覧


### インストール方法
~~~
$ git clone git@github.com:Team-E-Mario/nagano_cake.git
~~~
~~~
$ cd nagano-cake
~~~
~~~
$ rails db:migrate
~~~
~~~
$ rails db:seed
~~~
~~~
$ yarn install
~~~
~~~
$ bundle install
~~~

### 管理者ページのログインについて
初期段階での管理者ページのログインに必要なメールアドレス及びパスワードは下記です。
- メールアドレス：mario@mario
- パスワード：aaaaaa