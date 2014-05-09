class EndorsementsController < ApplicationController
  def endorse_params
    params.require(:endorse).permit(:skill, :endorser, :endorsee)
  end

  def create
    @endorse = Endorsement.new(endorse_params)
  end

  def destroy
    @endorse = endorse.find(params[:id])
    @endorse.destroy
    redirect_to users_path
  end

end