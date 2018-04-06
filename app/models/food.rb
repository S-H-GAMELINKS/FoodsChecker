class Food < ApplicationRecord
    mount_uploader :picture, PictureUploader

    def self.import(file)

        require 'csv'

        CSV.foreach(file.path, headers: true) do |row|
    
          food = new
          food.attributes = row.to_hash.slice(*updatable_attributes)
    
          food.save!
        end
    end
    
    def self.updatable_attributes
        ["name","date","food","place","count","counttype"]
    end
end
