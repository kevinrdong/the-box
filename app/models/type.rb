class Type < ApplicationRecord

	has_many :products,dependent: :destroy
	has_many :designers

	validates_presence_of :name
end
