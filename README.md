# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | unique: true            |
| password           | string              | null: false             |
| nickname           | string              | null: false             |
| family_name        | string              | null: false             |
| first_name         | string              | null: false             |
| family_name_kana   | string              | null: false             |
| first_name_kana    | string              | null: false             |
| birthday           | date                | null: false             |

### Association
- has_many :items
- has_many :orders

## items table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| name               | string              | null: false             |
| description        | text                | null: false             |
| category           | integer             | null: false             |
| state              | integer             | null: false             |
| burden             | integer             | null: false             |
| locality           | integer             | null: false             |
| days               | integer             | null: false             |
| price              | integer             | null: false             |

### Association
- belongs_to :user
- has_one :order

## delivery_address table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| postal_code        | string              | null: false             |
| active_hash        | integer             | null: false             |
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
