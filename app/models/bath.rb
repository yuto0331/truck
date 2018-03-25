class Bath < ApplicationRecord
    validates :name, presence: true
    has_many :preferences, dependent: :destroy
    belongs_to :user
    # has_many :preference_users, through: :preferences, source: :user
    mount_uploader :image, ImageUploader
end
