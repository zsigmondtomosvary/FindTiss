require "application_system_test_case"

class FavoriteCoursesTest < ApplicationSystemTestCase
  setup do
    @favorite_course = favorite_courses(:one)
  end

  test "visiting the index" do
    visit favorite_courses_url
    assert_selector "h1", text: "Favorite Courses"
  end

  test "creating a Favorite course" do
    visit favorite_courses_url
    click_on "New Favorite Course"

    fill_in "Short", with: @favorite_course.short
    fill_in "Title", with: @favorite_course.title
    fill_in "Url", with: @favorite_course.url
    fill_in "User", with: @favorite_course.user_id
    click_on "Create Favorite course"

    assert_text "Favorite course was successfully created"
    click_on "Back"
  end

  test "updating a Favorite course" do
    visit favorite_courses_url
    click_on "Edit", match: :first

    fill_in "Short", with: @favorite_course.short
    fill_in "Title", with: @favorite_course.title
    fill_in "Url", with: @favorite_course.url
    fill_in "User", with: @favorite_course.user_id
    click_on "Update Favorite course"

    assert_text "Favorite course was successfully updated"
    click_on "Back"
  end

  test "destroying a Favorite course" do
    visit favorite_courses_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Favorite course was successfully destroyed"
  end
end
