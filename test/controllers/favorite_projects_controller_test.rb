require 'test_helper'

class FavoriteProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_project = favorite_projects(:one)
  end

  test "should get index" do
    get favorite_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_project_url
    assert_response :success
  end

  test "should create favorite_project" do
    assert_difference('FavoriteProject.count') do
      post favorite_projects_url, params: { favorite_project: { short: @favorite_project.short, title: @favorite_project.title, url: @favorite_project.url, user_id: @favorite_project.user_id } }
    end

    assert_redirected_to favorite_project_url(FavoriteProject.last)
  end

  test "should show favorite_project" do
    get favorite_project_url(@favorite_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_project_url(@favorite_project)
    assert_response :success
  end

  test "should update favorite_project" do
    patch favorite_project_url(@favorite_project), params: { favorite_project: { short: @favorite_project.short, title: @favorite_project.title, url: @favorite_project.url, user_id: @favorite_project.user_id } }
    assert_redirected_to favorite_project_url(@favorite_project)
  end

  test "should destroy favorite_project" do
    assert_difference('FavoriteProject.count', -1) do
      delete favorite_project_url(@favorite_project)
    end

    assert_redirected_to favorite_projects_url
  end
end
