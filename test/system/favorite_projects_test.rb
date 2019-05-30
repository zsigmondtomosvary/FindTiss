require "application_system_test_case"

class FavoriteProjectsTest < ApplicationSystemTestCase
  setup do
    @favorite_project = favorite_projects(:one)
  end

  test "visiting the index" do
    visit favorite_projects_url
    assert_selector "h1", text: "Favorite Projects"
  end

  test "creating a Favorite project" do
    visit favorite_projects_url
    click_on "New Favorite Project"

    fill_in "Short", with: @favorite_project.short
    fill_in "Title", with: @favorite_project.title
    fill_in "Url", with: @favorite_project.url
    fill_in "User", with: @favorite_project.user_id
    click_on "Create Favorite project"

    assert_text "Favorite project was successfully created"
    click_on "Back"
  end

  test "updating a Favorite project" do
    visit favorite_projects_url
    click_on "Edit", match: :first

    fill_in "Short", with: @favorite_project.short
    fill_in "Title", with: @favorite_project.title
    fill_in "Url", with: @favorite_project.url
    fill_in "User", with: @favorite_project.user_id
    click_on "Update Favorite project"

    assert_text "Favorite project was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorite project" do
    visit favorite_projects_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite project was successfully destroyed"
  end
end
