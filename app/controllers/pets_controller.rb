class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def new
  end

  def create
    pet = Pet.new({
      name: params[:name],
      description: params[:description],
      image: params[:image],
      age: params[:age],
      sex: params[:sex],
      adoptability: params[:adoptability],
      shelter_id: params[:shelter_id]
      })

    pet.save

    redirect_to '/pets'
  end
end
