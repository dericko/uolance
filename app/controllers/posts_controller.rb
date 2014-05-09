class PostsController < ApplicationController
  def post_params
    params.require(:post).permit(:title, :description, :category, :date, :owner_id)
  end

  def new
  	if user_signed_in?
  		@post = Post.new
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
    @post = post.find(params[:id])
    @review = Review.new
  end

  def destroy
    @post = post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
end
