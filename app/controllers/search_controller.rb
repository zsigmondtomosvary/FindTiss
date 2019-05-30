class SearchController < ApplicationController

  def resultpeople

    $search = "Person"

    if params[:search].blank?
      flash.now[:alert] = "Please type something in the Search Field, to search!"
      render 'searchPeople'
    end

    @parameter = params[:search].to_s
    stringUrl = 'https://tiss.tuwien.ac.at/api/person/v21/psuche?q=' + @parameter + '&max_treffer=10'

    @results = gethash(stringUrl, "https://tiss.tuwien.ac.at/api/person/v21/id/", "id")


  end

  def resultcourses

    $search = "Course"

    if params[:search].blank?
      flash.now[:alert] = "Please type something in the Search Field, to search!"
      render 'searchCourses'
    end

    @parameter = params[:search].to_s
    stringUrl = 'https://tiss.tuwien.ac.at/api/search/course/v1.0/quickSearch?searchterm=' + @parameter + '&count=10'

    @results = gethash(stringUrl, "https://tiss.tuwien.ac.at/api/course/", "detail_url")

  end

  def resultprojects

    $search = "Project"

    if params[:search].blank?

      flash.now[:alert] = "Please type something in the Search Field, to search!"
      render 'searchProjects'

    end

      @parameter = params[:search].to_s
      stringUrl = 'https://tiss.tuwien.ac.at/api/search/projectFullSearch/v1.0/projects?searchterm=' + @parameter + '&count=10'

      @results = gethash(stringUrl, "https://tiss.tuwien.ac.at/api/pdb/rest/project/v2/", "id")

  end

  def resulttheses

    $search = "These"

    if params[:search].blank?

      flash.now[:alert] = "Please type something in the Search Field, to search!"
      render 'searchTheses'
      
    end

      @parameter = params[:search].to_s
      stringUrl = 'https://tiss.tuwien.ac.at/api/search/thesis/v1.0/quickSearch?searchterm=' + @parameter + '&count=10'

      @results = gethash(stringUrl, "https://tiss.tuwien.ac.at/api/thesis/", "id")

  end


  def searchPeople
    $search = params[:type]
  end

  def searchCourses
    $search = params[:type]
  end

  def searchProjects
    $search = params[:type]
  end

  def searchTheses
    $search = params[:type]
  end

  def gethash(firsturl, secondurl, param)

    require 'net/http'
    require 'nokogiri'
    require 'open-uri'

    uri = URI(firsturl)
    response = Net::HTTP.get(uri)

    ihash = {}

    if param == "detail_url"
      (0..JSON.parse(response)["results"].count-1).each do |i|
        ihash[i] = JSON.parse(response)["results"][i][param].to_s.match(/courseNr=(\w*)/)[1] + "-" +
            JSON.parse(response)["results"][i][param].to_s.match(/semester=(\w*)/)[1]
      end
    else
      (0..JSON.parse(response)["results"].count-1).each { |i| ihash[i] = JSON.parse(response)["results"][i][param].to_s }
    end

    ohash = {}

    (0..ihash.count-1).each do |i|
      ohash[i] = Hash.from_xml(Nokogiri::XML(open(secondurl + ihash[i])).to_s)
    end

    ohash
  end

end
