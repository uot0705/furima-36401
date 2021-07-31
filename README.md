## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false, unique: true |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false |
| first_name         | string | null: false |
| last_name          | string | null: false |
| first_name_kana    | string | null: false |
| last_name_kana     | string | null: false |
| birthday           | date   | null: false |

### Association
- has_many :items
- has_many :purchases

## itemsテーブル

| Column               | Type       | Options                        |
| -----------------    | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| explanation          | text       | null: false                    |
| product_category_id  | integer    | null: false                    |
| product_condition_id | integer    | null: false                    |
| delivery_fee_id      | integer    | null: false                    |
| delivery_area_id     | integer    | null: false                    |
| delivery_days_id     | integer    | null: false                    |
| price                | numeric    | null: false                    |
| user                 | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- has_one :purchase
- has_one_attached :image

## shippingsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |
| telephone number | string     | null: false                    |
| purchase         | references | null: false, foreign_key:true  |

### Association
- belongs_to  :purchase




## purchasesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key:true  |
| item              | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shipping