class DashboardController < ApplicationController

  def index
    @data=current_user.numbers
  end

end