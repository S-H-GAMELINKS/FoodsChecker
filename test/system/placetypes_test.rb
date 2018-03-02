require "application_system_test_case"

class PlacetypesTest < ApplicationSystemTestCase
  setup do
    @placetype = placetypes(:one)
  end

  test "visiting the index" do
    visit placetypes_url
    assert_selector "h1", text: "Placetypes"
  end

  test "creating a Placetype" do
    visit placetypes_url
    click_on "New Placetype"

    fill_in "Name", with: @placetype.name
    click_on "Create Placetype"

    assert_text "Placetype was successfully created"
    click_on "Back"
  end

  test "updating a Placetype" do
    visit placetypes_url
    click_on "Edit", match: :first

    fill_in "Name", with: @placetype.name
    click_on "Update Placetype"

    assert_text "Placetype was successfully updated"
    click_on "Back"
  end

  test "destroying a Placetype" do
    visit placetypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Placetype was successfully destroyed"
  end
end
