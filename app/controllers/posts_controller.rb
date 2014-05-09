class PostsController < ApplicationController
  def post_params
    params.require(:post).permit(:title, :description, :category, :date, :owner_id)
  end

  def new
  	if user_signed_in?
  		@post = Post.new
      @review = Review.new
      @review.post_id = @post.id
      @review.post_owner_id = @post.owner_id
  	else
  		redirect_to new_user_session_path
  	end
  end

  def create
  	@post = Post.new(post_params)
  	if @post.owner_id != current_user.id
  		redirect_to root_path
  	else
  		if @post.save
  			redirect_to posts_path
  		else
  			render 'new'
  		end
  	end
  end

  def cat_index
    @posts = Post.where(category: params[:category])
    render 'posts/index'
  end

  def index
  	@posts = Post.all
  end

  def edit
  	@post = Post.find(params[:id])
  end

  def update
  	@post = Post.find(params[:id])
  	if @post.owner_id != current_user.id
  		render 'edit'
  	else
  		if @post.update_attributes(post_params)
  			redirect_to posts_path(@post_id)
  		else
  			render 'edit'
  		end
  	end
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
