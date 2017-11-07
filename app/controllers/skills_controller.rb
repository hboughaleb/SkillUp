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

  def destroy
  end

  def update
  end

  def create
  end

  private
  def skill_params
    params.require(:restaurant).permit(:name, )
  def set_skill
    @skill = Skill.find(params[:id])
  end
end
