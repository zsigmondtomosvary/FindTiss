require 'test_helper'

class FavoritePeopleControllerTest < ActionDispatch::IntegrationTest
  setup do
    @favorite_person = favorite_people(:one)
  end

  test "should get index" do
    get favorite_people_url
    assert_response :success
  end

  test "should get new" do
    get new_favorite_person_url
    assert_response :success
  end

  test "should create favorite_person" do
    assert_difference('FavoritePerson.count') do
      post favorite_people_url, params: { favorite_person: { firstname: @favorite_person.firstname, image: @favorite_person.image, lastname: @favorite_person.lastname, prefixTitle: @favorite_person.prefixTitle, user_id: @favorite_person.user_id } }
    end

    assert_redirected_to favorite_person_url(FavoritePerson.last)
  end

  test "should show favorite_person" do
    get favorite_person_url(@favorite_person)
    assert_response :success
  end

  test "should get edit" do
    get edit_favorite_person_url(@favorite_person)
    assert_response :success
  end

  test "should update favorite_person" do
    patch favorite_person_url(@favorite_person), params: { favorite_person: { firstname: @favorite_person.firstname, image: @favorite_person.image, lastname: @favorite_person.lastname, prefixTitle: @favorite_person.prefixTitle, user_id: @favorite_person.user_id } }
    assert_redirected_to favorite_person_url(@favorite_person)
  end

  test "should destroy favorite_person" do
    assert_difference('FavoritePerson.count', -1) do
      delete favorite_person_url(@favorite_person)
    end

    assert_redirected_to favorite_people_url
  end
end
