class FavoritePeopleController < ApplicationController
  before_action :set_favorite_person, only: [:show, :edit, :update, :destroy]

  # GET /favorite_people
  # GET /favorite_people.json
  def index
    @favorite_people = FavoritePerson.order(params[:sort]).where(user_id: session[:user_id]).all
    puts @favorite_people
  end

  # GET /favorite_people/1
  # GET /favorite_people/1.json
  def show
  end

  # GET /favorite_people/new
  def new
    @favorite_person = FavoritePerson.new
  end

  # POST /favorite_people
  # POST /favorite_people.json
  def create

    @favorite_person = FavoritePerson.find_or_create_by(favorite_person_params)

    respond_to do |format|
      if @favorite_person.save
        format.html { redirect_to @favorite_person, notice: 'Favorite person was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_person }
      else
        format.html { render :new }
        format.json { render json: @favorite_person.errors, status: :unprocessable_entity }
      end
    end

  end


  # DELETE /favorite_people/1
  # DELETE /favorite_people/1.json
  def destroy
    @favorite_person.destroy
    respond_to do |format|
      format.html { redirect_to favorite_people_url, notice: 'Favorite person was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_person
      @favorite_person = FavoritePerson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_person_params
      params.require(:favorite_person).permit(:firstname, :lastname, :title, :email, :phonenumber, :image, :user_id)
    end
end
