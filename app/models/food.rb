class Food < ApplicationRecord
    mount_uploader :picture, PictureUploader
end
