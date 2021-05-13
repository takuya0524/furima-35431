# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | datetime            | null: false             |

### Association
- has_many :orders
- has_many :items

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| description        | text                | null: false             |
| category           | boolean             | null: false             |
| state              | boolean             | null: false             |
| burden             | boolean             | null: false             |
| locality           | boolean             | null: false             |
| days               | boolean             | null: false             |
| price              | integer             | null: false             |

### Association
- belongs_to :user
- has_one :order

## delivery_address table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | integer             | null: false             |
| province           | boolean             | null: false             |
| city               | string              | null: false             |
| street_address     | text                | null: false             |
| building_name      | text                |                         |
| telephone_number   | text                | null: false             |

### Association
- belongs_to :order

## orders table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| user_id            | integer             |                         |
| items_id           | integer             |                         |

### Association
- has_one :delivery_address