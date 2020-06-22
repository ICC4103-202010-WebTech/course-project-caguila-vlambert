require "application_system_test_case"

class EventVideosTest < ApplicationSystemTestCase
  setup do
    @event_video = event_videos(:one)
  end

  test "visiting the index" do
    visit event_videos_url
    assert_selector "h1", text: "Event Videos"
  end

  test "creating a Event video" do
    visit event_videos_url
    click_on "New Event Video"

    click_on "Create Event video"

    assert_text "Event video was successfully created"
    click_on "Back"
  end

  test "updating a Event video" do
    visit event_videos_url
    click_on "Edit", match: :first

    click_on "Update Event video"

    assert_text "Event video was successfully updated"
    click_on "Back"
  end

  test "destroying a Event video" do
    visit event_videos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Event video was successfully destroyed"
  end
end
