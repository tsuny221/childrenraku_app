class Users::EventAttendancesController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check
  before_action :current_event

  def new
    @event_attendance = EventAttendance.new
    @event_attendance.event_participants.build
  end

  def create
    @event_attendance = EventAttendance.new(event_attendance_params)
    @event_attendance.event_id = @event.id
    @event_attendance.family_id = current_user.family_id
    if @event_attendance.save
      flash[:success] = "出欠回答を送信しました。"
      redirect_to users_event_path(@event.id)
    else
      flash[:danger] = "出欠を選択してください。"
      # renderだとフォーム が増えていくバグが起きるため
      redirect_back(fallback_location: new_users_event_event_attendance_path)
    end
  end

  def edit
    @event_attendance = EventAttendance.find_by(event_id: @event.id, family_id: current_user.family_id)
  end

  def update
    @event_attendance = EventAttendance.find_by(event_id: @event.id, family_id: current_user.family_id)
    if @event_attendance.update(event_attendance_params)
      flash[:success] = "出欠回答を編集しました。"
      redirect_to users_event_path(@event.id)
    else
      flash[:danger] = "出欠を選択してください。"
      redirect_back(fallback_location: edit_users_event_event_attendance_path)
    end
  end

  private

  def event_attendance_params
    params.require(:event_attendance).permit(:attendance, :comment, event_participants_attributes: [:number_of_people, :relationship_name, :event_attendance_id, :id])
  end

  def current_event
    @event = Event.find(params[:event_id])
  end
end
