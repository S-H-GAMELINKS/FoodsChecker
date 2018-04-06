class Count < ApplicationRecord
    def self.import(file)

        require 'csv'

        CSV.foreach(file.path, headers: true) do |row|
    
          count = new
          count.attributes = row.to_hash.slice(*updatable_attributes)
    
          count.save!
        end
    end
    
    def self.updatable_attributes
        ["count"]
    end
end
