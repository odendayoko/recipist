## アプリケーション名
Recipist（レシピスト）

## URL
https://recipist.onrender.com

## テスト用アカウント
以下の通りのアドレスとパスワードでログインしサービスを体験していただけます。
- ログインページ: https://recipist.onrender.com/users/sign_in
- メールアドレス：test1@test.com
- パスワード：aaa111

## アプリケーション概要
Recipistは「作った料理のレシピサイトのURLなどの情報を記録しておけるWebアプリケーション」です。以下のような機能があります。

- 自分が作った料理を、そのレシピサイトのURLや写真などを含めてレシピとして投稿、一覧で表示する機能
- 自分が保存したレシピを検索する機能
- ユーザーを検索し、フォローできる機能
- フォローしたユーザーが投稿したレシピをお気に入り登録できる機能
- フォローしたユーザーの投稿したレシピを一覧で表示する機能
- OGP機能

## アプリケーションを制作した背景
私は料理が好きです。
日々料理をする中で、cookpadなどのレシピ投稿サイトだけでなく、YouTubeやTwitter、Instagramなども参照する機会が増え、以下のような課題を感じていました。
- レシピが複数のサイトに散在し、再度作ろうとしたときにどのサイトにあるのかわからない
- 家族や友人から共有されたレシピを保存しておくことができない
- 自分が作ったレシピ一覧を、写真やレシピサイトのURLと一緒に保存できるサービスがない

前述のアプリケーション概要に記述した3つの機能を実装したアプリを作成することで上記の悩みを解消できると考え、今回のアプリ作成に至りました。

またこの悩みは、日々料理を作る多くの人たちにも共通する問題であると考え、このアプリを作成する価値があると考えました。


## ペルソナ
主なターゲット: 女性

年齢: ２０〜３０代

職業: 会社員、学生

趣味: 料理好き。色々なレシピサイト、SNSを利用する

## ペルソナの課題
- SNSや動画サイトなどで作ったレシピをお気に入り登録しておくが、再度作りたいと思った時にどのサイトのレシピで登録したのか思い出せない
- 過去に母親が作ったレシピのURLをLINEで共有してもらったが、いつのメッセージかわからず見つけらない
- SNSは料理の投稿だけではないためレシピが検索しづらい

## アプリケーションの要件
[要件定義シート_Recipist](https://docs.google.com/spreadsheets/d/1ymzvCG_dJD9GH_IznyV5S7Xf6YgoruTtqqOvBvzWBM4/edit#gid=982722306)

## 利用方法
### ユーザー管理機能
#### 概要: 

アプリを利用するためのユーザー情報を管理します。
ユーザーの新規登録、ログイン、ログアウトが可能です。

### 投稿機能
#### 概要: 
ユーザーが「レシピ」を投稿することができます。
#### 手順: 
投稿ボタンをクリックします。
「レシピ」の情報を入力し投稿すると、トップページに反映されます。

### 一覧表示機能
#### 概要: 
投稿された「レシピ」が一覧で表示されます。
また、「レシピのURL」をクリックすると、該当するサイトが新規タブで開かれます。

### 詳細表示機能
#### 概要: 
一覧表示された「レシピ」の画像、または名前をクリックすると、「レシピ」の詳細ページが表示されます。
尚、自身が投稿した「レシピ」の場合、「編集」「削除」ボタンが表示され、そこから「レシピ」の編集や削除が可能です。

### お気に入り登録機能
#### 概要: 
「レシピ」の詳細ページにある星マークをクリックすると、お気に入り登録することができます。
お気に入り保存された「レシピ」は、後述のお気に入り一覧ページで閲覧が可能です。

### お気に入り一覧表示機能
#### 概要：
お気に入り登録した「レシピ」が一覧で表示されます。

### ユーザーフォロー/フォロワー機能
#### 概要：
自分以外のユーザーをフォローすることができます。
フォローしたユーザーの投稿した「レシピ」は、後述のフォローしたユーザーが投稿したレシピ一覧ページで閲覧が可能です
#### 手順：
ユーザー検索画面から、ユーザーのニックネームを検索し、クリックすると、ユーザーの詳細ページが表示されるので、フォローをクリックします。

### OGP機能
#### 概要：
アプリのリンクをシェアした場合、OGTが表示され、アプリの名前、説明が表示されます。
詳細ページのリンクをシェアした場合は、レシピの画像と名前が表示されます。

## 実装予定の機能
- ユーザー情報編集・削除機能
ユーザー情報(ニックネーム、メールアドレス、パスワード)を編集できる機能です。 また併せて削除できる機能も実装予定です。

- レシピのタグ付け機能
「お弁当のおかず」、「主食」、「肉料理」、「居酒屋メニュー」などのタグをつけて、「レシピ」を保存する機能です。タグの名前でレシピを検索できる機能も実装予定です。

## データベース設計
![ER図 drawio](https://github.com/odendayoko/recipist/assets/128268777/b297fd00-1b17-4937-b3cc-1fca5bf4645a)

## 画面遷移図
![画面遷移図 drawio](https://github.com/odendayoko/recipist/assets/128268777/7ec7c682-0472-423b-b903-9396a183bc00)

## 開発環境
- 言語
HTML / CSS / Ruby / Ruby on Rails /JavaScript
- サービス
Render / GitHub / AWS





