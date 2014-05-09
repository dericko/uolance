class UsersController < ApplicationController
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

  def new
  	@users = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to users_path
  	else
  		render 'new'
  	end
  end

  def index
  	@users = User.all
  end

  def show
  	if user_signed_in?
      @user = current_user

      # User's skills
      @skills = Skill.where(skill_id: current_user.id)

      # User's skill endorsements
      @endorsers = Endorsement.where(endorser_id: current_user.id)
      @endorser_id = []
      @endorsers.each do |endorse|
        @endorser_id.push(endorse.endorser_id)
      end

      # User's posts
      @posts = Post.where(owner_id: current_user.id)

      # User's reviews
      @reviews = Review.where(reviewer_id: current_user.id)
      @review_id = []
      @reviews.each do |review|
        @review_id.push(review.reviewer_id)
      end
    else 
      redirect_to users_path
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to users_path(@user.id)
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path
  end
end