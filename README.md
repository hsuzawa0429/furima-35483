# README

# テーブル設計
## users テーブル
| column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| last_name          | string  | null: false               |
| first_name         | string  | null: false               |
| last_name_kana     | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday           | date    | null: false               |

## Association
- has_many: items
- has_one: buyer

## items テーブル
| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| item_name        | string     | null: false                    |
| detail           | text       | null: false                    |
| category_id      | integer    | null: false                    |
| condition_id     | integer    | null: false                    |
| delivery_fee_id  | integer    | null: false                    |
| shipping_area_id | integer    | null: false                    |
| shipping_day_id  | integer    | null: false                    |
| price            | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

## Association
- belongs_to: user
- has_one: buyer

## buyers テーブル
| column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## Association
- belongs_to: user
- belongs-to: item
- has_one: address

## addresses テーブル
| column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures_id | integer    | null: false                    |
| city           | string     | null: false                    |
| address_detail | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | string     | null: false                    |
| buyer          | references | null: false, foreign_key: true |

## Association
- belongs_to: buyer