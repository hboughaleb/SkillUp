class AteliersController < ApplicationController
  before_action :set_user, only: [:create, :index]
  before_action :set_skill, only: [:create, :new]
  before_action :set_atelier, only: [:show]

  def new
    @atelier = Atelier.new
  end

  def index
    @ateliers = Atelier.where('user_id = ?', "#{params[:user_id]}")

  end

  def create
     @atelier = Atelier.new(atelier_params)
     @atelier.skill = @skill
    if @atelier.save
      redirect_to atelier_path(@atelier)
    else
      render :new
    end
  end

  def show
  end

  private

  def atelier_params
    params.require(:atelier).permit(:date, :completed, :user_id, :skill_id)
  end

  def set_atelier
    @atelier = Atelier.find(params[:id])
  end

  def set_user
   @user = User.find(params[:user_id])
  end

  def set_skill
    @skill = Skill.find(params[:skill_id])
  end
end

