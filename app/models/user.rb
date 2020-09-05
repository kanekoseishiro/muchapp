class User < ApplicationRecord
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :nickname, length: { maximum: 20 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }
    validates :age, format: { with:/[0-9]\d/ }
    validates :gender, numericality: { other_than: 1 }
    validates :birthday
    validates :prefecture, numericality: { other_than: 1 }
    validates :phone_number, length: { maximum: 11 }
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
