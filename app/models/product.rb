class Product < ApplicationRecord

	belongs_to :department

	validates :name, length: { minimum: 4 }
	validates :price, presence: true
end
