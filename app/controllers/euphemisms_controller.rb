class EuphemismsController < ApplicationController

  def random
    @euphemisms = (params[:euphemism_type] == "random") ? Euphemism.random(5) : Euphemism.consonance(5)

    render json: @euphemisms
  end

end
