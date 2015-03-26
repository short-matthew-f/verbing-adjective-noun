class EuphemismsController < ApplicationController
  def popular
    @euphemisms = Euphemism.order(like_count: :desc).take(10)
  end

  def index
    @user = current_user
  end

  def like
    @user = current_user
    @euphemism = Euphemism.find(params[:id])

    @vote = Vote.find_or_initialize_by(user: @user, euphemism: @euphemism)
    @vote.approve = true
    @vote.save

    @euphemism.like_count += 1
    @euphemism.save

    render json: @vote
  end

  def dislike
    @user = current_user
    @euphemism = Euphemism.find(params[:id])

    @vote = Vote.find_or_initialize_by(user: @user, euphemism: @euphemism)
    @vote.approve = false
    @vote.save

    render json: @vote
  end

  def fetch
    @user = current_user
    @euphemism = Euphemism.order('RANDOM()')
                          .where.not(id: @user.judgement_ids)
                          .first
    if @euphemism
      render json: {
        id: @euphemism.id,
        content: @euphemism.to_s
      }
    else
      render json: nil
    end
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
