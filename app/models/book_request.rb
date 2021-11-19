class BookRequest < ApplicationRecord
	enum status: [:pending, :request, :rejected, :approve]
	belongs_to :book
	belongs_to :user
end
