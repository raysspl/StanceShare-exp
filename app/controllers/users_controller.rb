class UsersController < ApplicationController
	def show
		@user = User.find(params[:id])
		@parts = @user.parts.page(params[:page]).per_page(10)
	end

	def create
		@user = User.new(params[:user].permit(:name, :email))
		@user.save 
		redirect_to 'index'
	end

	def index
		@user = User.all
		render nothing: true
	end
end
