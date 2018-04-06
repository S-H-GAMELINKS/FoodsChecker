class Placetype < ApplicationRecord
    def self.import(file)

        require 'csv'

        CSV.foreach(file.path, headers: true) do |row|
    
          placetype = new
          placetype.attributes = row.to_hash.slice(*updatable_attributes)
    
          placetype.save!
        end
    end
    
    def self.updatable_attributes
        ["name"]
    end
end
