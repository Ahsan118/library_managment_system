class Admin::CategoriesController < ApplicationController
	before_action :find_id, only:[:edit, :update,:destroy]

	def index
		@category = Category.all.paginate(page: params[:page],per_page: 5)
	end
	
	def new
		@category = Category.new
		@category.sub_categories.build
	end
	
	def create
		@category = Category.new(cat_params)
		if @category.save
			redirect_to admin_categories_path
		else
			redirect_to new_admin_category_path
			flash[:alert] = "Fields are required!"
		end

	end
	
	def edit; end
	
	def update
		@category.update(cat_params)
		redirect_to admin_categories_path
	end
	
	def destroy
		@category.destroy
		redirect_to admin_categories_path
	end
	
	private
	
	def cat_params
		params.require(:category).permit(:title, sub_categories_attributes: [:subcat,:status])
	end
	
	def find_id
		@category = Category.find(params[:id])
	end
end
