class StaticController < ApplicationController

  def home
    @euphemisms = Euphemism.random(3)
  end

end
