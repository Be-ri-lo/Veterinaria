class PetsController < ApplicationController
  before_action :set_pet, only: %i[ show edit update destroy ]
  before_action :set_client
  # GET /pets or /pets.json
  def index
    @pets = Pet.all
    @pets = @client.pets
  end

  # GET /pets/1 or /pets/1.json
  def show
  end

  # GET /pets/new
  def new
    @pet = Pet.new
    @pet = @client.pets.build
  end

  # GET /pets/1/edit
  def edit
  end

  # POST /pets or /pets.json
  def create
    @pet = @client.pets.build(pet_params)

    respond_to do |format|
      if @pet.save
        format.html { redirect_to [@client, @pet], notice: "Pet was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pets/1 or /pets/1.json
  def update
    respond_to do |format|
      if @pet.update(pet_params.merge(client: @client))
        format.html { redirect_to [@client, @pet], notice: "Pet was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pets/1 or /pets/1.json
  def destroy
    @pet.destroy
    respond_to do |format|
      format.html { redirect_to [@client, @pet], notice: "Pet was successfully destroyed." }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pet
      @pet = Pet.find(params[:id])
    end

    def set_client
      @client = Client.find(params[:client_id])
    end
    
    # Only allow a list of trusted parameters through.
    def pet_params
      params.require(:pet).permit(:name, :breed, :birthday)
    end
end
