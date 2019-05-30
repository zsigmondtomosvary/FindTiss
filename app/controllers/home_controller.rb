class HomeController < ApplicationController
  def index
  end
  def main
  end
  def favorites
  end


  def details
    if params[:person]

      @details = {"firstname" => params[:person]["firstname"], "lastname" => params[:person]["lastname"],
                  "prefixTitle" => params[:person]["preceding_titles"], "email" => params[:person]["main_email"],
                  "phonenumber" => params[:person]["main_phone_number"], "image" => params[:person]["picture_uri"]}

      redirect_to p_details_path(@details)

    elsif params[:course]

      @details = {"title" => params[:course]["title"]["en"], "objective" => params[:course]["objective"]["en"],
                  "teachingcontent" => params[:course]["teachingContent"]["en"], "url" => params[:course]["url"]}
      redirect_to c_details_path(@details)

    elsif params[:project]

      @details = {"title" => params[:project]["titleEn"], "form" => params[:project]["projectForm"],
                  "abstract" => params[:project]["abstractEn"] ,"id" => params[:project]["id"]}

      redirect_to pr_details_path(@details)

    else

      @details = {"thesistype" => params[:thesis]["thesisType"], "title" => params[:thesis]["title"]["en"],
                  "instname" => params[:thesis]["instituteName"]["en"], "url" => params[:thesis]["url"]}
      redirect_to t_details_path(@details)

    end

  end

end
