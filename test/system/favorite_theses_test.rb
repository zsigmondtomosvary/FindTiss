require "application_system_test_case"

class FavoriteThesesTest < ApplicationSystemTestCase
  setup do
    @favorite_thesis = favorite_theses(:one)
  end

  test "visiting the index" do
    visit favorite_theses_url
    assert_selector "h1", text: "Favorite Theses"
  end

  test "creating a Favorite these" do
    visit favorite_theses_url
    click_on "New Favorite These"

    fill_in "Short", with: @favorite_thesis.short
    fill_in "Title", with: @favorite_thesis.title
    fill_in "Url", with: @favorite_thesis.url
    fill_in "User", with: @favorite_thesis.user_id
    click_on "Create Favorite these"

    assert_text "Favorite these was successfully created"
    click_on "Back"
  end

  test "updating a Favorite these" do
    visit favorite_theses_url
    click_on "Edit", match: :first

    fill_in "Short", with: @favorite_thesis.short
    fill_in "Title", with: @favorite_thesis.title
    fill_in "Url", with: @favorite_thesis.url
    fill_in "User", with: @favorite_thesis.user_id
    click_on "Update Favorite these"

    assert_text "Favorite these was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorite these" do
    visit favorite_theses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite these was successfully destroyed"
  end
end
