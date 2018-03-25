class Restaurant < ApplicationRecord
    validates :name, presence: true
    has_many :favorites, dependent: :destroy
    has_many :comments, dependent: :destroy
    belongs_to :user
    # has_many :favorite_users, through: :favorites, source: :user
    mount_uploader :image, ImageUploader
    
end
