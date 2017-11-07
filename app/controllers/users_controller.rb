class UsersController < ApplicationController
  before_action :set_user_id, except: [:index, :new]

  def index
    @user = User.all
    # look in query string for search params
    # if they exist filter users
    # otherwise, show all of them
  end

  def show
    @user = User.find(@user_id)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user_id)
    else
      render :new
    end
  end

  def edit
    @user = @user_id
  end

  def update
    @user = @user_id
    if @user.update_attributes(user_params)
      redirect_to user_path(@user_id)
    else
      render 'edit'
    end
  end

  # only admin can delete a user, a user cannot
  # def destroy
  #   @user.destroy
  # end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :address, :photo)
  end

  def set_user_id
    @user_id = User.find(params[:id])
  end
end
