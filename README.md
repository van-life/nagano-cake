# Nagano-Cake
___________

DMM-WEBCAMPのチーム開発したECサイト！

___________

## 設計図
- ER図は[こちら](https://drive.google.com/file/d/1KL5JRue0R4qxf31ChITFntzdmqt1fWbf/view?usp=sharing)
- テーブル定義書は[こちら](https://docs.google.com/spreadsheets/d/1XNHdZiq5PTODkugJ4J7pTvfzj-HkcKc1Kpo4VdvlIrc/edit?usp=sharing)
- 詳細設計書は[こちら](https://docs.google.com/spreadsheets/d/1YQowVH7B3rOR6eTbM4y5zItrLdqxEhqiDAvq4S6I7qo/edit?usp=sharing)

___________

## 機能一覧
カスタマー側
- ログイン/ログアウト機能
- 会員登録/退会機能
- 会員情報編集機能
- 商品一覧/詳細表示機能
- カート内に商品追加, カート内商品の一覧表示/編集機能
- 注文機能（支払い方法や配送先の選択）
- 配送先追加/編集機能
- 注文履歴一覧/詳細表示機能
- 検索機能(商品名、ジャンル名）
- トップページに新着商品のスライドショー

アドミン側
- ログイン/ログアウト機能
- 注文履歴の一覧/詳細表示機能（注文ステータス, 製作ステータスの切り替えが可能）
- 会員一覧/詳細表示機能（会員ステータスを有効/退会に切り替えが可能）
- 商品一覧/詳細表示機能
- 商品情報変更機能（販売ステータスの変更が可能）
- 商品のジャンル設定機能

___________

### 環境
- Ruby2.6.3
- Rails5.2.6
- HTML5
- CSS3

___________

### Gem
- devise
- refile
- refile-mini_magick
- bootstrap
- jquery-rails
- kaminari
- font-awesome-sass
- enum_help

___________

### 開発メンバー
カスタマー側
- 大沢ちゃん
- まさや
アドミン側
- しうへい
- キロフ
