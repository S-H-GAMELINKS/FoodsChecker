class Foodtype < ApplicationRecord
    def self.import(file)
    
        require 'csv'
    
        CSV.foreach(file.path, headers: true) do |row|
        
          foodtype = new
          foodtype.attributes = row.to_hash.slice(*updatable_attributes)
        
          foodtype.save!
        end
    end
        
    def self.updatable_attributes
        ["foodtype"]
    end
end
