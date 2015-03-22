class StaticController < ApplicationController

  def home
    @euphemism = Euphemism.random
  end

end
