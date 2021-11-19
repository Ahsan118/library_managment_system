class Book < ApplicationRecord
	belongs_to  :sub_category
	has_many :book_requests
	has_many :users, through: :book_requests
	ratyrate_rateable 'writer', 'visual_effects', 'original_score', 'director', 'custome_design'
	
end
