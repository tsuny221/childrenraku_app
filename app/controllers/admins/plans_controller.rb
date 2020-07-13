class Admins::PlansController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  before_action :current_room_families_children
  def index
    @plans = Plan.order(start_time: "DESC").where(child_id: @children).page(params[:page])
  end

  private

  def plan_params
    params.require(:plan).permit(:start_date, :comnet, :attendant)
  end
  def current_room_families_children
    @room = current_admin.room
    @families = Family.where(room_id: @room.id)
    @children = Child.where(family_id: @families)
  end
end
