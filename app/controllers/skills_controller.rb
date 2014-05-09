class SkillsController < ApplicationController
  def skill_params
  	params.require(:skill).permit(:skill, :description, :experience, :user_id)
  end

  def new
  	if user_signed_in?
  		@skill = Skill.new
  	else
  		redirect_to new_user_session_path
  	end
  end

  def create
  	@skill = Skill.new(skill_params)
    if @skill.user_id != current_user.id
  	 render 'new'
    else
      if @skill.save
  		  redirect_to skills_path
  	 else
  	 	 render 'new'
  	 end
  end

  def index
  	@skills = Skill.all
  end

  def show
  	@skill = Skill.find(params[:id])
  end
  
  def edit
  	@skill = Skill.find(params[:id])
  end

  def update
  	@skill = Skill.find(params[:id])
  	if @skill.update_attributes(skill_params)
      redirect_to skill_path(@skill.id)
    else
      render 'edit'
    end
  end

  def destroy
    @skill = Skill.find(params[:id])
    @skill.destroy
    redirect_to skills_path
  end
end
