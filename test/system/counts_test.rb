require "application_system_test_case"

class CountsTest < ApplicationSystemTestCase
  setup do
    @count = counts(:one)
  end

  test "visiting the index" do
    visit counts_url
    assert_selector "h1", text: "Counts"
  end

  test "creating a Count" do
    visit counts_url
    click_on "New Count"

    fill_in "Count", with: @count.count
    click_on "Create Count"

    assert_text "Count was successfully created"
    click_on "Back"
  end

  test "updating a Count" do
    visit counts_url
    click_on "Edit", match: :first

    fill_in "Count", with: @count.count
    click_on "Update Count"

    assert_text "Count was successfully updated"
    click_on "Back"
  end

  test "destroying a Count" do
    visit counts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Count was successfully destroyed"
  end
end
