class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?

  def search
    case params[:type]
      when "title", "category"
        @posts = Post.where(params[:type] + " LIKE ?", "%" + params[:search]+"%")
        render 'posts/index'
      when "name", "email"
        @users = User.where(params[:type] + " LIKE ?", "%" + params[:search]+"%")
        render 'users/index'
      else
        render 'none'
      end
  end

  protected

  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:first_name, :last_name, 
  												:email, :password, :password_confirmation,
  												:year, :is_org, :org_name)}
  	devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:first_name, :last_name, 
  												:email, :password, :password_confirmation, :current_password,
  												:year, :is_org, :org_name)}  	
  end

end
