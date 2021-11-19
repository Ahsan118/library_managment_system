class Admin::SubCategoriesController < ApplicationController
	before_action :find_id, only:[:edit, :update,:destroy]
	before_action :find_category, only:[:index, :new, :edit, :update,:destroy]
	def index
		@sub = @category.sub_categories.paginate(page: params[:page],per_page: 5)
	end
	def new
		@sub = @category.sub_categories.new
		@sub.books.build
	end
	def create
		@sub = SubCategory.create(sub_params)
		redirect_to admin_sub_categories_path(category: @sub.category_id)
	end
	def edit
		
	end
	def update
		@sub.update(sub_params)
		redirect_to admin_sub_categories_path(category: @sub.category_id)
	end
	def destroy
		@sub.destroy
		redirect_to admin_sub_categories_path(category: @sub.category_id)
	end
	private

	def sub_params
		params.require(:sub_category).permit(:subcat, :status, :category_id, books_attributes:[:book_title,:status] )
	end

	def find_id
		@sub = SubCategory.find(params[:id])
	end

	def find_category
		@category = Category.find_by_id(params[:category])		
	end
end
