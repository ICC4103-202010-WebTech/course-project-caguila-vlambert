require 'test_helper'

class HourProposalsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @hour_proposal = hour_proposals(:one)
  end

  test "should get index" do
    get hour_proposals_url
    assert_response :success
  end

  test "should get new" do
    get new_hour_proposal_url
    assert_response :success
  end

  test "should create hour_proposal" do
    assert_difference('HourProposal.count') do
      post hour_proposals_url, params: { hour_proposal: {  } }
    end

    assert_redirected_to hour_proposal_url(HourProposal.last)
  end

  test "should show hour_proposal" do
    get hour_proposal_url(@hour_proposal)
    assert_response :success
  end

  test "should get edit" do
    get edit_hour_proposal_url(@hour_proposal)
    assert_response :success
  end

  test "should update hour_proposal" do
    patch hour_proposal_url(@hour_proposal), params: { hour_proposal: {  } }
    assert_redirected_to hour_proposal_url(@hour_proposal)
  end

  test "should destroy hour_proposal" do
    assert_difference('HourProposal.count', -1) do
      delete hour_proposal_url(@hour_proposal)
    end

    assert_redirected_to hour_proposals_url
  end
end
