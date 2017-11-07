class ReviewsController < ApplicationController
  before_action :set_user_id, only: [:edit, :show, :create, :index]

  def index
    @review = Review.where(user_id: @user_id)
  end

  def show
    @review = Review.user_id
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to review_path(@review.user_id)
    else
      render :new
    end
  end

  def edit
    @review = @user_id
  end

  def update
    @review = @review.user_id
    if @review.update_attributes(review_params)
      redirect_to review_path(@review.user_id)
    else
      render 'edit'
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end

  def set_user_id
    @user_id = User.find(params[:id])
  end
end

