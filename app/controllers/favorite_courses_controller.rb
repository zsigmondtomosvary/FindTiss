class FavoriteCoursesController < ApplicationController
  before_action :set_favorite_course, only: [:show, :edit, :update, :destroy]

  # GET /favorite_courses
  # GET /favorite_courses.json
  def index
    @favorite_courses = FavoriteCourse.order(params[:sort]).where(user_id: session[:user_id]).all
  end

  # GET /favorite_courses/1
  # GET /favorite_courses/1.json
  def show
  end

  # GET /favorite_courses/new
  def new
    @favorite_course = FavoriteCourse.new
  end


  # POST /favorite_courses
  # POST /favorite_courses.json
  def create
    @favorite_course = FavoriteCourse.find_or_create_by(favorite_course_params)

    respond_to do |format|
      if @favorite_course.save
        format.html { redirect_to @favorite_course, notice: 'Favorite course was successfully created.' }
        format.json { render :show, status: :created, location: @favorite_course }
      else
        format.html { render :new }
        format.json { render json: @favorite_course.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /favorite_courses/1
  # DELETE /favorite_courses/1.json
  def destroy
    @favorite_course.destroy
    respond_to do |format|
      format.html { redirect_to favorite_courses_url, notice: 'Favorite course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorite_course
      @favorite_course = FavoriteCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def favorite_course_params
      params.require(:favorite_course).permit(:title, :objective, :teachingcontent, :url, :user_id)
    end
end
