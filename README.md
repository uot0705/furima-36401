## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
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

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| name              | string     | null: false                    |
| email             | string     | null: false                    |
| explanation       | text       | null: false                    |
| product_category  | string     | null: false                    |
| product_condition | string     | null: false                    |
| delivery_fee      | string     | null: false                    |
| delivery_days     | string     | null: false                    |
| price             | string     | null: false                    |
| user              | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- has_one :purchase
- has_one_attached :image
- has_one :shipping

## shippingsテーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | string     | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     | null: false                    |
| telephone number | string     | null: false                    |
| item             | references | null: false, foreign_key:true  |

### Association
- has_one :purchase
- belongs_to :item




## purchasesテーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | null: false, foreign_key:true  |
| item              | references | null: false, foreign_key:true  |
| shipping          | references | null: false, foreign_key:true  |

### Association
- belongs_to :user
- belongs_to :item
- belongs_to :shipping