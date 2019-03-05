class NumbersController < ApplicationController
  skip_before_action :verify_authenticity_token,only: [:destroy]

  def index

  end

  def new

  end

  def create
    begin
      Number.create(user_id: current_user.id, phone: params[:number], description: params[:description])
      flash[:success] = 'Successful add'
      redirect_to dashboard_path
    rescue Exception => e
      flash[:error] = e.message
      render new_number_path
    end
  end


  def destroy
    @number = Number.find(params[:id])
    @number.destroy
    redirect_to dashboard_path
  end

  def show
    @number = Number.find(params[:id])
  end

  def update
    begin
      @number = Number.find(params[:id])
      if !@number.update_attributes(number_params)
        raise 'Can not edit Number'
      end
      flash[:success] = 'Successful edited'
    rescue Exception => e
      flash[:error] = e.message
    end
    redirect_to dashboard_path

  end

  private

  def number_params
    params.require(:number).permit(:phone, :description)
  end
end