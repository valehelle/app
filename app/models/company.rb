class Company < ApplicationRecord
    belongs_to :user
    mount_uploader :banner, BannerUploader
end
