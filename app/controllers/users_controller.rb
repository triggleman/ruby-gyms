class UsersController < ApplicationController
  #
  # before_action :require_user, only: [:show]
	# before_action :require_current_user, only: [:show]


  def new
		@user = User.new
	end

  def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			redirect_to signup_path
		end
	end

  def show
    @user = User.find(params[:id])
    @userInfo = User.where(:id => @user)
  end



  private

  def user_params
		params.require(:user).permit(:email, :password, :name)
	end

end
