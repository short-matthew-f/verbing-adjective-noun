class EuphemismsController < ApplicationController
  def index
    @user = current_user
  end

  def fetch
    @user = current_user
    @euphemism = Euphemism.order('RANDOM()')
                          .where.not(id: @user.judgement_ids)
                          .first
    render json: {
      euphemism: {
        id: @euphemism.id,
        content: @euphemism.to_s
      }
    }
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
