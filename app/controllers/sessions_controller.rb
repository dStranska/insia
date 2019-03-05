class SessionsController < ApplicationController

  layout "application"
  skip_before_action :authenticate!, only: [:new, :create]
  skip_before_action :verify_authenticity_token,only: [:destroy]

  def new

  end

  def create

    begin

      if !User.exists?(email: params[:email])
        raise "User with this email does not exist"
      end

      user = User.find_by(email: params[:email])
      if !user.authenticate(params[:password])
        raise "Bad Password"
      else
        session[:user_id] = user.id
      end

      flash[:success] = 'Successful login'
      return redirect_to dashboard_path
    rescue Exception => e
      flash[:error] = e.message

      render new_sessions_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to new_sessions_path
  end

end