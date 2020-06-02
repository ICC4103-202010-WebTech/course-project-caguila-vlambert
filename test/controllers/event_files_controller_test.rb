require 'test_helper'

class EventFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_file = event_files(:one)
  end

  test "should get index" do
    get event_files_url
    assert_response :success
  end

  test "should get new" do
    get new_event_file_url
    assert_response :success
  end

  test "should create event_file" do
    assert_difference('EventFile.count') do
      post event_files_url, params: { event_file: {  } }
    end

    assert_redirected_to event_file_url(EventFile.last)
  end

  test "should show event_file" do
    get event_file_url(@event_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_file_url(@event_file)
    assert_response :success
  end

  test "should update event_file" do
    patch event_file_url(@event_file), params: { event_file: {  } }
    assert_redirected_to event_file_url(@event_file)
  end

  test "should destroy event_file" do
    assert_difference('EventFile.count', -1) do
      delete event_file_url(@event_file)
    end

    assert_redirected_to event_files_url
  end
end
