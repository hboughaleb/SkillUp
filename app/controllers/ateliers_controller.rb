class AteliersController < ApplicationController
  before_action :set_user, only: [:create, :index]
  before_action :set_skill, only: [:create, :new]
  before_action :set_atelier, only: [:show]

  def new
    @atelier = Atelier.new
  end

  def index
    # My_ateliers permet de recuperer les réservations qui me sont faites
    @my_ateliers = Atelier.joins(:skill).where('skills.user_id = ?', current_user.id)
    # ateliers permet de recuperer les réservations que j'ai faites
    @ateliers = Atelier.where('user_id = ?', current_user.id)

  end

  def create
     @atelier = Atelier.new(atelier_params)
     @atelier.skill = @skill
     @atelier.user = current_user
     @atelier.completed = false

    if @atelier.save
      redirect_to user_ateliers_path(current_user)
    else
      render :new
    end
  end

  def show
  end

  def edit
    @atelier = Atelier.find(params[:id])
  end

  def update
    @atelier = Atelier.find(params[:id])
    @atelier.update(atelier_params)
    redirect_to atelier_path(@atelier)
  end

  def destroy
    @atelier = atelier.find(params[:id])
    @atelier.destroy

    # no need for app/views/ateliers/destroy.html.erb
    redirect_to ateliers_path
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

