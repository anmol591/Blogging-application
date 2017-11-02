class Product < ApplicationRecord
	belongs_to :category
	validates_presence_of :name, :message => "Name must be present"
	validates_presence_of :price, :message => "Price must be present"
	validates_presence_of :category_id, :message => "Category must be present"
	validates_numericality_of :price, :message=>"Price must be number"
end
