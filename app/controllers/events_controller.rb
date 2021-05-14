class EventsController < ApplicationController
  before_action :authenticate_user!
  def index
    @events = Event.all.map do |item|
      {
        id: item.id,
        title: item.description,
        start: item.initial_date.strftime('%Y-%m-%d %H:%M:%S'),
        end: item.final_date.strftime('%Y-%m-%d %H:%M:%S')
      }
    end
end