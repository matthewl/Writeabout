class HomeController < ApplicationController
  def show
    @prompt = Prompt.random
  end
end