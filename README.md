# README

# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| password           | string | null: false  |
| family_name        | string | null: false  |
| first_name         | string | null: false  |
| family_name_kana   | string | null: false  |
| first_name_kana    | string | null: false  |
| birthday           | date   | null: false  |

### Association

- has_many :items
- has_many :purchases



## items テーブル

| Column             | Type    | Options                           |
| ------------------ | ------- | --------------------------------- |
| name               | string  | null: false                       |
| information        | text    | null: false                       |
| category_id        | integer | null: false                       |
| status_id          | integer | null: false                       |
| postage_id         | integer | null: false                       |
| place_id           | integer | null: false                       |
| schedule_id        | integer | null: false                       |
| price              | integer | null: false                       |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to : user
- has_one    : purchase



## transports テーブル

| Column             | Type    | Options                           |
| ------------------ | ------- | --------------------------------- |
| post               | string  | null: false                       |
| place_id           | integer | null: false                       |
| city               | string  | null: false                       |
| address            | string  | null: false                       |
| building           | string  | null: false                       |
| phone              | string  | null: false                       |
| purchase           | references | null: false, foreign_key: true |

### Association

belongs_to : purchase



## purchases テーブル

| Column             | Type    | Options                           |
| ------------------ | ------- | --------------------------------- |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association

belongs_to : user
belongs_to : purchase
has_one    : transport