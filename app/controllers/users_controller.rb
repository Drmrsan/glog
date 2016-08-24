class UsersController < ApplicationController
	before_action :authenticate_user!
	def index
		@users = User.all.paginate( page: params[:page], per_page: 3 )
	end

	def show
		@user = User.find(params[:id])
		@post = @user.posts.paginate(page: params[:page], per_page: 3)
	end
end