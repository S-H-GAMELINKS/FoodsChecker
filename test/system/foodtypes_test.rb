require "application_system_test_case"

class FoodtypesTest < ApplicationSystemTestCase
  setup do
    @foodtype = foodtypes(:one)
  end

  test "visiting the index" do
    visit foodtypes_url
    assert_selector "h1", text: "Foodtypes"
  end

  test "creating a Foodtype" do
    visit foodtypes_url
    click_on "New Foodtype"

    fill_in "Name", with: @foodtype.name
    click_on "Create Foodtype"

    assert_text "Foodtype was successfully created"
    click_on "Back"
  end

  test "updating a Foodtype" do
    visit foodtypes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @foodtype.name
    click_on "Update Foodtype"

    assert_text "Foodtype was successfully updated"
    click_on "Back"
  end

  test "destroying a Foodtype" do
    visit foodtypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Foodtype was successfully destroyed"
  end
end
