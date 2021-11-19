class Admin::BooksController < ApplicationController
	before_action :find_id ,only:[:edit,:update,:destroy]
	before_action :find_sub_category,only:[:index,:new,:edit,:update,:destroy]
	def index
		@books=  @sub_category.books.paginate(page: params[:page],per_page: 5)
	end
	
	def new
		@books= @sub_category.books.new
	end
	
	def create
		@books = Book.create(book_params)
		redirect_to admin_books_path(sub_id: @books.sub_category_id)
	end

	def edit
	end

	def update
		@books.update(book_params)
		redirect_to admin_books_path(sub_id: @books.sub_category_id)
	end

	def destroy
		@books.destroy
		redirect_to admin_books_path(sub_id: @books.sub_category_id)
	end
	private
	def book_params
		params.require(:book).permit(:book_title,:status,:sub_category_id)
	end
	def find_id
		@books = Book.find(params[:id]) 
	end
	def find_sub_category
		@sub_category = SubCategory.find_by_id(params[:sub_id])
	end
end

