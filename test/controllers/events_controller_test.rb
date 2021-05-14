# frozen_string_literal: true

require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @event = events(:one)
    @user = users(:one)
  end

  test 'should get index' do
    get '/users/sign_in'
    sign_in @user
    get events_url
    assert_response :success
  end

  test 'should not get index user without identifying' do
    get events_url
    assert_response :found
  end

  test 'should create valid params' do
    get '/users/sign_in'
    sign_in @user
    post user_session_url
    assert_difference('Event.count') do
      post events_url, params: {
        description: 'Test',
        initial_date: '2019-10-07 13:00:00',
        final_date: '2019-10-07 14:00:00'
      }
    end
  end

  test 'should not create user without identifying' do
    assert_no_difference('Event.count') do
      post events_url, params: {
        description: 'Test',
        initial_date: '2019-10-07 13:00:00',
        final_date: '2019-10-07 14:00:00'
      }
    end
  end

  test 'should not create user invalid params' do
    get '/users/sign_in'
    sign_in @user
    post user_session_url
    assert_no_difference('Event.count') do
      post events_url, params: {
        description: '',
        initial_date: '2019-10-07 13:00:00',
        final_date: '2019-10-07 14:00:00'
      }
    end
    assert_response 400
  end

  test 'should destroy event' do
    get '/users/sign_in'
    sign_in @user
    post user_session_url
    assert_difference('Event.count', -1) do
      delete event_url(@event)
    end
  end

  test 'should not destroy event user without identifying' do
    assert_no_difference('Event.count', -1) do
      delete event_url(@event)
    end
  end
end
