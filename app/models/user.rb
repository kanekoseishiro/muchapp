class User < ApplicationRecord
  has_one_attached :image
  has_many :members
  
  with_options presence: true do
    validates :image
    validates :nickname, length: { maximum: 20 }
    validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i }, length: { minimum: 6 }, on: :create
    validates :age, format: { with:/[0-9]\d/ }, on: :create
    validates :gender, numericality: { other_than: 1 }, on: :create
    validates :birthday, on: :create
    validates :prefecture, numericality: { other_than: 1 }
    validates :phone_number, length: { maximum: 11 }, on: :create
  end
  
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
