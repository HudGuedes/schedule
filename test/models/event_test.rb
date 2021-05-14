# frozen_string_literal: true

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @user = users(:one)
  end

  test 'should save valid event' do
    event = Event.new
    event.description = 'test'
    event.initial_date = '2019-10-07 13:00:00'
    event.final_date = '2019-10-07 14:00:00'
    event.user = @user
    assert event.save
  end

  test 'should not save event without require columns' do
    event = Event.new
    assert_not event.save
  end

  test 'should not save event without description' do
    event = Event.new
    event.initial_date = '2019-10-07 13:00:00'
    event.final_date = '2019-10-07 14:00:00'
    event.user = @user
    assert_not event.save
  end

  test 'should not save event without initial_date' do
    event = Event.new
    event.description = 'test'
    event.final_date = '2019-10-07 14:00:00'
    event.user = @user
    assert_not event.save
  end

   test 'should not save event without final_date' do
    event = Event.new
    event.description = 'test'
    event.initial_date = '2019-10-07 14:00:00'
    event.user = @user
    assert_not event.save
  end

  test 'should not save event existing dates' do
    event = Event.new
    event.description = 'test'
    event.initial_date = '2019-10-07 09:00:00'
    event.final_date = '2019-10-07 10:00:00'
    event.user = @user
    assert_not event.save
  end

  test 'should not save invalid hour' do
    event = Event.new
    event.description = 'test'
    event.initial_date = '2019-10-07 05:00:00'
    event.final_date = '2019-10-07 06:00:00'
    event.user = @user
    assert_not event.save
  end

  test 'should not save saturday date' do
    event = Event.new
    event.description = 'test'
    event.initial_date = '2019-10-12 09:00:00'
    event.final_date = '2019-10-12 10:00:00'
    event.user = @user
    assert_not event.save
  end

   test 'should not save sunday date' do
    event = Event.new
    event.description = 'test'
    event.initial_date = '2019-10-13 09:00:00'
    event.final_date = '2019-10-13 10:00:00'
    event.user = @user
    assert_not event.save
  end

end
