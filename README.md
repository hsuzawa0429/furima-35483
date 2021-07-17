# README

# テーブル設計
## users テーブル
| column          | Type    | Options     |
| --------------- | ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| last_name       | string  | null: false |
| first_name      | string  | null: false |
| last_name_kana  | string  | null: false |
| first_name_kana | string  | null: false |
| birth_year      | integer | null: false |
| birth_month     | integer | null: false |
| birth_day       | integer | null: false |

## Association
- has_many: items
- has_one: buyer

## items テーブル
| column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| detail        | text       | null: false                    |
| category      | string     | null: false                    |
| condition     | string     | null: false                    |
| delivery_fee  | integer    | null: false                    |
| shipping_area | string     | null: false                    |
| shipping_days | string     | null: false                    |
| price         | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |

## Association
- belongs_to: user
- has_one: buyer
- has_one: image

## buyers テーブル
| column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| card_id          | integer    | null: false                    |
| expiration_month | integer    | null: false                    |
| expiration_year  | integer    | null: false                    |
| security_code    | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |
| item_id          | references | null: false, foreign_key: true |

## Association
- belongs_to: user
- belongs-to: item
- has_one: address

## addresses テーブル
| column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| city           | string     | null: false                    |
| address_detail | string     | null: false                    |
| building_name  | string     | null: false                    |
| phone_number   | integer    | null: false                    |
| buyer_id       | references | null: false, foreign_key: true |

## Association
- belongs_to: buyer

## images テーブル
| column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| item_image | text       | null: false                    |
| item_id    | references | null: false, foreign_key: true |

## Association
- belongs_to: item