require_dependency 'access/application_controller'

module Access
	class UsersController < ApplicationController
		before_action :set_user, only: [:edit, :show, :update, :destroy]

		def index
			@users = Access::User.all
		end

		def new
			@user = Access::User.new
			@user.user_contracts.build
		end

		def create
			@user = Access::User.new(set_params)
			if @user.save
				flash[:success] = t :success
				redirect_to action: 'index'
			else
				render action: 'new'
			end
		end

		def show
		end

		def edit
		end

		def update
			if @user.update(set_update_params)
				flash[:success] = t :success
				redirect_to action: 'index'
			else
				render action: 'edit'
			end
		end

		def destroy
			if @user.destroy
				flash[:success] = t :success
				redirect_to action: 'index'
			end
		end

		private

		def set_params
			params.require(:user).permit(:name, :user_type, :status, :email, 
																	 :password, :password_confirmation, 
																	 user_contracts_attributes: [:contract_id, :id, :_destroy])
		end
		
		def set_update_params
			params.require(:user).permit(:name, :user_type, :status, :email,
																	 user_contracts_attributes: [:contract_id, :id, :_destroy])
		end

		def set_user
			@user = User.find(params[:id])
		end
	end
end