class SkillsController < ApplicationController
  before_action :set_skill, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:user_show, :create, :new]
  def index
    if params[:search]
      @skills = Skill.where('name ILIKE ?', "%#{params[:search]}%")
    else
      @skills = Skill.all
    end

    @hash = Gmaps4rails.build_markers(@skills) do |skill, marker|
      marker.lat skill.user.latitude
      marker.lng skill.user.longitude
      # marker.infowindow render_to_string(partial: "/flats/map_box", locals: { flat: flat })
    end
  end

  def show
    @hash = Gmaps4rails.build_markers(@skill) do |skill, marker|
      marker.lat skill.user.latitude
      marker.lng skill.user.longitude
    end
  end

  def user_show
    @hash = Gmaps4rails.build_markers(@skill) do |skill, marker|
      marker.lat skill.user.latitude
      marker.lng skill.user.longitude
    end
  end

  def new
    @skill = Skill.new
  end

  def create
    @skill = Skill.new(skill_params)
    @skill.user = current_user
    if @skill.save!
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @skill.update(skill_params)
      redirect_to skill_path(@skill)
    else
      render :edit
    end
  end

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def skill_params
    params.require(:skill).permit(:name, :description, :photo)
  end
end
