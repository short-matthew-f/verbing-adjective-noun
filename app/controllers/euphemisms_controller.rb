class EuphemismsController < ApplicationController

  def random
    @euphemism = (params[:euphemism_type] == "random") ? Euphemism.random : Euphemism.aliterative

    render json: {
      verb: @euphemism.verb.content,
      adjective: @euphemism.adjective.content,
      noun: @euphemism.noun.content
    }
  end

end
