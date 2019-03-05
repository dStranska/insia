class ApplicationController < ActionController::Base
  include ApplicationHelper
  layout "application"

  protect_from_forgery prepend: true, with: :exception

  before_action :authenticate!

  def authenticate!
    unless session[:user_id]
      unless User.exists?(session[:user_id])
        redirect_to new_sessions_path
      end
    end
  end

end

