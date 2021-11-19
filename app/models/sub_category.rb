class SubCategory < ApplicationRecord
	belongs_to :category
	has_many :books
	accepts_nested_attributes_for :books, reject_if: :all_blank, allow_destroy: true
	validates :subcat , presence: { message: "must be given please" }

end
