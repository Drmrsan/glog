class CategoriesController < ApplicationController
before_action :check_admin, only: [:new, :edit, :update]
	def index
		@categories = Category.all
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.create(category_params)
		if @category.save
			flash[:success] = "Category successfully created!"
			redirect_to categories_path
		else
			render 'new'
		end
	end

	def show
		@category = Category.find(params[:id])
		@category_posts = @category.posts
	end

	private
		def category_params
			params.require(:category).permit(:name)
		end

		def check_admin
			if !current_user.admin?
				flash[:error] = "Only admin can create or edit category! Please request admin permissions for these actions!"
				redirect_to root_path
			end
		end
end
