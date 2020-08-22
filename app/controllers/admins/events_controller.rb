class Admins::EventsController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  before_action :current_room

  def index
    @events = Event.where(room_id: @room.id)
  end

  def show
    @event = Event.find(params[:id])
    @families = Family.where(room_id: @room.id)
    @q = EventAttendance.where(event_id: @event.id).page(params[:page]).ransack(params[:q])
    @event_attendances = @q.result(distinct: true)
     # イベントに紐づく出欠のうち出席のもののみ抽出
    @event_attendances_attend = @event_attendances.where(attendance: 1)
    @attendance_members = EventParticipant.where(event_attendance_id: @event_attendances_attend.ids)
    # その出欠から人数内訳情報を引っ張っている
    # そのイベントに紐づく出席人数内訳
    @fathers = @attendance_members.where(relationship_name: 1).where.not(number_of_people: 0)
    @mothers = @attendance_members.where(relationship_name: 2).where.not(number_of_people: 0)
    @children = @attendance_members.where(relationship_name: 3).where.not(number_of_people: 0)
    @infants = @attendance_members.where(relationship_name: 4).where.not(number_of_people: 0)
    @others = @attendance_members.where(relationship_name: 5).where.not(number_of_people: 0)
    @total = @fathers.size + @mothers.size + @children.size + @infants.size + @others.size
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.room_id = @room.id
    if @event.save
      redirect_to admins_events_path
      flash[:success] = "イベントを作成しました。"
    else
      render :new
  end
end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admins_events_path
      flash[:success] = "イベントを編集しました。"
    else
      render :edit
 end
end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admins_events_path
    flash[:success] = "イベントを削除しました。"
  end

  private

  def event_params
    params.require(:event).permit(:explanation, :start_time, :title)
  end

  def current_room
    @room = current_admin.room
  end
end
