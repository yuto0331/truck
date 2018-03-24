class User < ApplicationRecord
    mount_uploader :image, ImageUploader
    validates :name, presence: true, length: { maximum: 30 }
    validates :email, presence: true, length: { maximum: 255 },
    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
    before_save { email.downcase! }
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    has_many :favorites, dependent: :destroy
    has_many :restaurants, dependent: :destroy
    has_many :favorite_restaurants, through: :favorites, source: :restaurant
    has_many :comments
    has_many :baths
    has_many :preferences, dependent: :destroy
    has_many :preference_baths, through: :preferences, source: :bath
end
