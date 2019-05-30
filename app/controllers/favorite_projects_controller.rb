class FavoriteProjectsController < ApplicationController
  before_action :set_favorite_project, only: [:show, :edit, :update, :destroy]

  # GET /favorite_projects
  # GET /favorite_projects.json
  def index
    @favorite_projects = FavoriteProject.order(params[:sort]).where(user_id: session[:user_id]).all
  end

  # GET /favorite_projects/1
  # GET /favorite_projects/1.json
  def show
  end

  # GET /favorite_projects/new
  def new
    @favorite_project = FavoriteProject.new
  end

  # GET /favorite_projects/1/edit
  def edit
  end

  # POST /favorite_projects
  # POST /favorite_projects.json
  def create
    @favorite_project = FavoriteProject.find_or_create_by(favorite_project_params)

    respond_to do |format|
      if @favorite_project.save
        format.html { redirect_to @favorite_project, notice: 'Favorite project was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_project }
      else
        format.html { render :new }
        format.json { render json: @favorite_project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favorite_projects/1
  # DELETE /favorite_projects/1.json
  def destroy
    @favorite_project.destroy
    respond_to do |format|
      format.html { redirect_to favorite_projects_url, notice: 'Favorite project was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_project
      @favorite_project = FavoriteProject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_project_params
      params.require(:favorite_project).permit(:title, :form, :abstract, :url, :user_id)
    end
end
