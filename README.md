
## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| password            | string  | null: false |
| age                 | integer | null: false |
| gender              | integer | null: false |
<!-- | face_image          |  | null: false | -->
| hobby               | string  |             |
| birthday            | date    | null: false |
| postal_code         | string  |             |
| prefecture          | integer | null: false |
| city                | string  |             |
| house_number        | string  |             |
| building_name       | string  |             |
| phone_number        | string  | null: false |
| explanation         | text    |             |


### Association

- has_many :rooms
- has_many :messages
- has_many :follows
- has_many :follow_backs


## rooms テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :messages


## messages テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
<!-- | image   |   | null: false                    | -->
| content | text    | null: false                    |
| user_id | integer | null: false, foreign_key: true |
| item_id | integer | null: false  foreign_key: true |

### Association

- belongs_to :user
- belongs_to :room


## followsテーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :mach


## follow_backs テーブル

| Column  | Type    | Options                        |
| ------- | ------- | ------------------------------ |
| user_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one    :mach


## muches テーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| follow_id      | integer | null: false, foreign_key: true |
| follow_back_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :follow
- belongs_to :follow_back