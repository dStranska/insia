class UsersController < ApplicationController

  layout "application"

  skip_before_action :authenticate!, only: [:new, :create]

  def new
    @user = User.new

  end

  def create
    begin
      @user = User.new(user_params)
      if !@user.save
        raise
      end

      flash[:success] = 'User was created'
      redirect_to new_sessions_path
    rescue Exception => e
      flash[:error] = 'Can not create user'
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end