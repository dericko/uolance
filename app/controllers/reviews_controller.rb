class ReviewsController < ApplicationController
  def review_params
  	params.require(:review).permit(:title, :body, :post_id, 
  								   :reviewer_id, :reviewee_id)
  end

  def new
    if user_signed_in?
     @review = Review.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
  	@review = Review.new(review_params)
    if @review.user_id != current_user.id
      render 'new'
    else
  	   if @review.save
  	   	  redirect_to reviews_path
  	   else
  		  render 'new'
  	   end
    end
  end

  def index
  	@reviews = Review.all
  end

  def edit
    if user_signed_in?
      @review = Review.find(params[:id])
    else
      redirect_to new_user_session_path
    end
  end

  def update
    @review = Review.find(params[:id])
    if @review.user_id != current_user.id
      render 'new'
    else
      if @review.update_attributes(review_params)
        redirect_to review_path(@review.id)
      else
        render 'edit'
      end
    end
  end

  def show
	@review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to reviews_path
  end
end