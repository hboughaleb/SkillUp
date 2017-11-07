class SkillsController < ApplicationController
  before_action :set_skill, only [:show, :edit, :update, :destroy]

  def index
    @skills = Skill.all
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def create
    Skill.create(restaurant_params)
    redirect_to skills_path
  end

  def edit
  end

  def update
    @skill.update(skill_params)
    redirect_to skill_path(@skill)

  def destroy
    @skill.destroy
    redirect_to skills_path
  end

  private
  def skill_params
    params.require(:skill).permit(:name, :description)
  end

  def set_skill
    @skill = Skill.find(params[:id])
  end
end
