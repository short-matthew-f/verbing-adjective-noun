class EuphemismsController < ApplicationController
  def index
    @user = current_user
    @euphemism = Euphemism.random.first
  end

  def create
    @euphemism = Euphemism.find_or_create_by(euphemism_params)
    render json: @euphemism
  end

  private

  def euphemism_params
    params.require(:euphemism).permit(:verb_id, :adjective_id, :noun_id)
  end

end
