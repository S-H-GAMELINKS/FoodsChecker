require "application_system_test_case"

class CounttypesTest < ApplicationSystemTestCase
  setup do
    @counttype = counttypes(:one)
  end

  test "visiting the index" do
    visit counttypes_url
    assert_selector "h1", text: "Counttypes"
  end

  test "creating a Counttype" do
    visit counttypes_url
    click_on "New Counttype"

    fill_in "Counttype", with: @counttype.counttype
    click_on "Create Counttype"

    assert_text "Counttype was successfully created"
    click_on "Back"
  end

  test "updating a Counttype" do
    visit counttypes_url
    click_on "Edit", match: :first

    fill_in "Counttype", with: @counttype.counttype
    click_on "Update Counttype"

    assert_text "Counttype was successfully updated"
    click_on "Back"
  end

  test "destroying a Counttype" do
    visit counttypes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Counttype was successfully destroyed"
  end
end
