class FavoriteThesesController < ApplicationController
  before_action :set_favorite_thesis, only: [:show, :edit, :update, :destroy]

  # GET /favorite_theses
  # GET /favorite_theses.json
  def index
    @favorite_theses = FavoriteThese.order(params[:sort]).where(user_id: session[:user_id]).all
  end

  # GET /favorite_theses/1
  # GET /favorite_theses/1.json
  def show
  end

  # GET /favorite_theses/new
  def new
    @favorite_thesis = FavoriteThese.new
  end

  # GET /favorite_theses/1/edit
  def edit
  end

  # POST /favorite_theses
  # POST /favorite_theses.json
  def create
    @favorite_thesis = FavoriteThese.find_or_create_by(favorite_thesis_params)

    respond_to do |format|
      if @favorite_thesis.save
        format.html { redirect_to @favorite_thesis, notice: 'Favorite these was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_thesis }
      else
        format.html { render :new }
        format.json { render json: @favorite_thesis.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_theses/1
  # DELETE /favorite_theses/1.json
  def destroy
    @favorite_thesis.destroy
    respond_to do |format|
      format.html { redirect_to favorite_theses_url, notice: 'Favorite these was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_thesis
      @favorite_thesis = FavoriteThese.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_thesis_params
      params.require(:favorite_thesis).permit(:ttype, :title, :institution, :url, :user_id)
    end
end
