class Admin::DashboardsController < ApplicationController
	def index
		@count = Category.count
		@book = Book.count
		@request = BookRequest.where(status: 'request').count
	end
end
