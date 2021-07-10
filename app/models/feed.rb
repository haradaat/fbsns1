class Feed < ApplicationRecord
    mount_uploader :image, ImageUploader
    belongs_to :user
    validates :content, length: { in:1..145 }
end
