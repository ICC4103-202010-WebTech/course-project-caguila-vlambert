require 'test_helper'

class EventVideosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event_video = event_videos(:one)
  end

  test "should get index" do
    get event_videos_url
    assert_response :success
  end

  test "should get new" do
    get new_event_video_url
    assert_response :success
  end

  test "should create event_video" do
    assert_difference('EventVideo.count') do
      post event_videos_url, params: { event_video: {  } }
    end

    assert_redirected_to event_video_url(EventVideo.last)
  end

  test "should show event_video" do
    get event_video_url(@event_video)
    assert_response :success
  end

  test "should get edit" do
    get edit_event_video_url(@event_video)
    assert_response :success
  end

  test "should update event_video" do
    patch event_video_url(@event_video), params: { event_video: {  } }
    assert_redirected_to event_video_url(@event_video)
  end

  test "should destroy event_video" do
    assert_difference('EventVideo.count', -1) do
      delete event_video_url(@event_video)
    end

    assert_redirected_to event_videos_url
  end
end
