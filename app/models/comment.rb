class Comment < ApplicationRecord
    validates :name, presence: true
    belongs_to :user
    belongs_to :restaurant
    mount_uploader :image, ImageUploader
end
