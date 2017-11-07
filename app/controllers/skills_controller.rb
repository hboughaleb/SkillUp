class SkillsController < ApplicationController
  before_action :set_skill, only [:show, :edit]

  def index
    @skills = Skill.all
  end

  def show
  end

  def new
    @skill = Skill.new
  end

  def edit
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :description, :photo)
  end
end
