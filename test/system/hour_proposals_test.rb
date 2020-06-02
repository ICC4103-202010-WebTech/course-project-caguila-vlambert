require "application_system_test_case"

class HourProposalsTest < ApplicationSystemTestCase
  setup do
    @hour_proposal = hour_proposals(:one)
  end

  test "visiting the index" do
    visit hour_proposals_url
    assert_selector "h1", text: "Hour Proposals"
  end

  test "creating a Hour proposal" do
    visit hour_proposals_url
    click_on "New Hour Proposal"

    click_on "Create Hour proposal"

    assert_text "Hour proposal was successfully created"
    click_on "Back"
  end

  test "updating a Hour proposal" do
    visit hour_proposals_url
    click_on "Edit", match: :first

    click_on "Update Hour proposal"

    assert_text "Hour proposal was successfully updated"
    click_on "Back"
  end

  test "destroying a Hour proposal" do
    visit hour_proposals_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Hour proposal was successfully destroyed"
  end
end
