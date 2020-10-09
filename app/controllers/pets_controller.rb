class PetsController < ApplicationController
  def index
    @pets = ['Pet1', 'Pet2', 'Pet3']
  end
end
