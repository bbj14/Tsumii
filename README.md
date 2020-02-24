![tsumii](https://user-images.githubusercontent.com/40915287/75146380-4f679a00-573e-11ea-8c69-77e644ee9d55.png)

Tsumiiは、詰将棋（将棋のパズル）を投稿し共有できるサービスです。

## アプリURL
https://tsumii.work

## トップページ
![Tsumiiトップ](https://user-images.githubusercontent.com/40915287/75155136-b3945900-5752-11ea-8506-64d61387c54a.png)

## 機能
* ログイン不要の機能
  * 作品閲覧

* ログイン必須の機能
  * 作品投稿
  * 作品へのいいね
  * 他ユーザーのフォロー
  * 作品のチェック機能（解答済、後で解く）
  * 作品に対するコメント

## 使用技術
* フレームワーク：Ruby on Rails
* 言語
  * フロントエンド：HTML(Slim), CSS(Bootstrap), javascript(jQuery)
  * バックエンド：Ruby
* データベース：MySQL
* インフラ：AWS（VPC, EC2, RDS, S3(画像保存用), Route53, ACM, ELB, IAM）
* テスト：Rspec, Capybara, Factorybot
* CI/CD：CircleCI, Capistrano(CircleCIによるデプロイまで対応)
