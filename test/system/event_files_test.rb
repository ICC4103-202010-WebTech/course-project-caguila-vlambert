require "application_system_test_case"

class EventFilesTest < ApplicationSystemTestCase
  setup do
    @event_file = event_files(:one)
  end

  test "visiting the index" do
    visit event_files_url
    assert_selector "h1", text: "Event Files"
  end

  test "creating a Event file" do
    visit event_files_url
    click_on "New Event File"

    click_on "Create Event file"

    assert_text "Event file was successfully created"
    click_on "Back"
  end

  test "updating a Event file" do
    visit event_files_url
    click_on "Edit", match: :first

    click_on "Update Event file"

    assert_text "Event file was successfully updated"
    click_on "Back"
  end

  test "destroying a Event file" do
    visit event_files_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event file was successfully destroyed"
  end
end
