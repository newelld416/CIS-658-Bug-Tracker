class WelcomeController < ApplicationController
  def index
    @bugs = Bug.last(3)
  end
end
