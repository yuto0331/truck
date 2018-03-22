class Bath < ApplicationRecord
    has_many :preference, dependent: :destroy
    belongs_to :user
    has_many :preference_users, through: :preference, source: :user
    mount_uploader :image, ImageUploader
end
