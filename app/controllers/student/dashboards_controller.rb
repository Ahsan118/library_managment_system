class Student::DashboardsController < ApplicationController
	before_action :find_book,only:[:book_request]
	before_action :find_request,only:[:destroy]
	
	def index
		@count = Category.count
		@sub_category = SubCategory.count
		@book = Book.where(status: "Active").count
	end

	def destroy
		@status.destroy
		redirect_to show_subcategories_student_dashboard_path(@request.sub_category.category)
	end

	def show_categories
		@category = Category.paginate(page: params[:page],per_page: 5)
	end
	
	def show_books
		@params = params[:textfield]
		if @params.nil?
		@books = Book.where(status:'Active').paginate(page: params[:page],per_page: 5).includes(sub_category: [:category])
		else
		@books = Book.where(status:'Active').includes(sub_category: [:category])
		@books = @books.where('book_title LIKE ?', "%#{@params}%")
		end
	end

	def show_subcategories
		@category = SubCategory.where(category_id: params[:id]).paginate(page: params[:page],per_page: 5)
	end

	def book_request
		@create = current_user.book_requests.create(book_id: @book.id, status: 1)
		redirect_to show_subcategories_student_dashboard_path(@book.sub_category.category)
	end
	
	def filter_by_search
		@book_params = params[:search]
		@category = SubCategory.where(subcat:@book_params)
	end
	
	def drop_down_filter
		if params[:drop1].present?
		@drop_params = params[:drop1]
		@books = Category.find_by(id:@drop_params ).sub_categories
		respond_to do |format|
       		format.json {
            render json: {books: @books}
        	}
    	end
    	elsif params[:drop2].present?
    		@drop2_params = params[:drop2]
    	end
		# @drop_params = params[:drop1]
		# if @drop_params.nil?
		# 	@books = Book.where(status:'Active').includes(sub_category: [:category])
		# else
		# 	@books = Category.find_by(id:@drop_params ).sub_categories
		# respond_to do |format|
		  #      		format.json {
		  #           render json: {books: @books}
		  #       	}
		  #   	end
		# end
	end
	def logout

		respond_to do |format|
			format.js
		end
	end
	private

	# def book_params
	# 	params.require(:book_request).permit(:user_id,:book_id)
	# end

	def find_book
		@book = Book.find(params[:id]) 
	end

	def find_request
		@request = Book.find(params[:id])
		@status= @request.book_requests.first
	end
end
