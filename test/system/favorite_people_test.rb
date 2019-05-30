require "application_system_test_case"

class FavoritePeopleTest < ApplicationSystemTestCase
  setup do
    @favorite_person = favorite_people(:one)
  end

  test "visiting the index" do
    visit favorite_people_url
    assert_selector "h1", text: "Favorite People"
  end

  test "creating a Favorite person" do
    visit favorite_people_url
    click_on "New Favorite Person"

    fill_in "Firstname", with: @favorite_person.firstname
    fill_in "Image", with: @favorite_person.image
    fill_in "Lastname", with: @favorite_person.lastname
    fill_in "Prefixtitle", with: @favorite_person.prefixTitle
    fill_in "User", with: @favorite_person.user_id
    click_on "Create Favorite person"

    assert_text "Favorite person was successfully created"
    click_on "Back"
  end

  test "updating a Favorite person" do
    visit favorite_people_url
    click_on "Edit", match: :first

    fill_in "Firstname", with: @favorite_person.firstname
    fill_in "Image", with: @favorite_person.image
    fill_in "Lastname", with: @favorite_person.lastname
    fill_in "Prefixtitle", with: @favorite_person.prefixTitle
    fill_in "User", with: @favorite_person.user_id
    click_on "Update Favorite person"

    assert_text "Favorite person was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorite person" do
    visit favorite_people_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite person was successfully destroyed"
  end
end
