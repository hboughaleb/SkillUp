class ReviewsController < ApplicationController
  before_action :set_user_id, only: [:edit, :show]

  def show
    @review = Review.user_id
  end

  def new
    @review = Review.new
  end

  def edit
    @review = Review.update(review_params)
     if @review.save
      redirect_to review_path(@review.user_id)
    else
      render :new
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

