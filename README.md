# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | unique: true null: false            |
| encrypted_password | string              | null: false             |
| nickname           | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |

### Association
- has_many :items
- has_many :orders
- has_many :comments

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| description        | text                | null: false             |
| category_id        | integer             | null: false             |
| state_id           | integer             | null: false             |
| burden_id          | integer             | null: false             |
| prefecture_id      | integer             | null: false             |
| delivery_day_id    | integer             | null: false             |
| price              | integer             | null: false             |
| user               | references          | null: false foreign_key: true            |

### Association
- belongs_to :user
- has_one :order
- has_many :comments

## delivery_addresses table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| prefecture_id      | integer             | null: false             |
| city               | string              | null: false             |
| street_address     | string              | null: false             |
| building_name      | string              |                         |
| telephone_number   | string              | null: false             |
| order              | references          | null: false foreign_key: true            |

### Association
- belongs_to :order

## orders table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user               | references          | foreign_key: true       |
| item               | references          | foreign_key: true       |

### Association
- has_one :delivery_address
- belongs_to :user
- belongs_to :item
