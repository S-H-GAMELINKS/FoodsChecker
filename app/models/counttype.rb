class Counttype < ApplicationRecord
    def self.import(file)

        require 'csv'

        CSV.foreach(file.path, headers: true) do |row|
    
          counttype = new
          counttype.attributes = row.to_hash.slice(*updatable_attributes)
    
          counttype.save!
        end
    end
    
    def self.updatable_attributes
        ["counttype"]
    end
end
