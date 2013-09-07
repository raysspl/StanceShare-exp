require 'spec_helper'

# a MOCK is a standin for a object. a MOCK is a double, sometimes. it preemptively watches for a method to happen
# a STUB is a standin for a method

describe UsersController do
	describe 'create method' do 
		it 'should create and save a user' do
			mock_model('User') #because we don't have a user model yet, but we're pretending that we do
			User.stub({:save => true, :new => User})
			User.should_receive(:save)
			post :create, user: {name: 'Delmer Reed', email: 'del@taco.com' }
		end
	end

	describe 'show method' do
		it 'should show user' do
			User.should_receive(:find).with(1)
			get :show, id: 1
			response.status.should eq(200)
		end
	end	

	describe 'index' do
		it 'should return a list of users' do
			User.should_receive(:all)
			get :index
		end
	end
end
