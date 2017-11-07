class AteliersController < ApplicationController
  before_action :set_user_id, only: [:show, :create, :index]

  def new
    @atelier = Atelier.new
  end

  def index
    @atelier = Atelier.user_id.all
  end

  def create
     @atelier = Atelier.new(atelier_params)
    if @atelier.save
      redirect_to atelier_path(@atelier.user_id)
    else
      render :new
    end
  end

  def show
    @atelier = Atelier.user_id
  end

  private

  def atelier_params
    params.require(:atelier).permit(:date, :complted)
  end
   def set_user_id
   @user_id = User.find(params[:id])
  end
end

