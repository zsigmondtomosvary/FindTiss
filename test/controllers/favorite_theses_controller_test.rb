require 'test_helper'

class FavoriteThesesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_thesis = favorite_theses(:one)
  end

  test "should get index" do
    get favorite_theses_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_thesis_url
    assert_response :success
  end

  test "should create favorite_thesis" do
    assert_difference('FavoriteThese.count') do
      post favorite_theses_url, params: { favorite_thesis: { short: @favorite_thesis.short, title: @favorite_thesis.title, url: @favorite_thesis.url, user_id: @favorite_thesis.user_id } }
    end

    assert_redirected_to favorite_thesis_url(FavoriteThese.last)
  end

  test "should show favorite_thesis" do
    get favorite_thesis_url(@favorite_thesis)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_thesis_url(@favorite_thesis)
    assert_response :success
  end

  test "should update favorite_thesis" do
    patch favorite_thesis_url(@favorite_thesis), params: { favorite_thesis: { short: @favorite_thesis.short, title: @favorite_thesis.title, url: @favorite_thesis.url, user_id: @favorite_thesis.user_id } }
    assert_redirected_to favorite_thesis_url(@favorite_thesis)
  end

  test "should destroy favorite_thesis" do
    assert_difference('FavoriteThese.count', -1) do
      delete favorite_thesis_url(@favorite_thesis)
    end

    assert_redirected_to favorite_theses_url
  end
end
