class Users::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check
  before_action :current_room

  def index
    @events = Event.where(room_id: @room.id)
  end

  def show
    @event = Event.find(params[:id])
    @event_attendance = EventAttendance.find_by(event_id: @event.id, family_id: current_user.family_id)
  end

  private

  def current_room
    @room = current_user.room
  end
end
