class UsersController < ApplicationController
	
	def create
		@user = User.new(params[:user].permit(:name, :email))
		@user.save 
		redirect_to 'index'
	end

	def show
		@user = User.find(1)
		render nothing: true
	end

	def index
		@user = User.all
		render nothing: true
	end
end
