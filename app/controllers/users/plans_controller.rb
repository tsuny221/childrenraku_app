class Users::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check
  before_action :current_user_children
  before_action :set_start_date, only: [:index, :new]
  def index
    @plans = Plan.where(child_id: @children.ids)
  end

  def new
    @room = current_user.room
    @events = Event.where(room_id: @room.id)
    @child = Child.find_by(id: params[:child_id])
    @plan = Plan.find_by(child_id: @child.id, start_time: @start_date.beginning_of_day)
    if @plan.present?
      @plans = Plan.where(child_id: @child.id)
    else
      @plans = PlanCollection.new
    end
    # シンプルカレンダーのstart_dateとその子どもに紐づく予定が存在するかどうかで、更新と新規を切り替える
  end

  def create
    @plans = PlanCollection.new(plans_params)
    @plans.save
    flash[:success] = "登録が完了しました。"
    redirect_to users_plans_path
  end

  def update
    @child = Child.find_by(id: params[:id])
    @plans = plans_params.keys.each do |id|
      plan = Plan.find(id)
      plan.update_attributes(plans_params[id])
      plan
    end
    flash[:success] = "編集が完了しました。"
    redirect_to users_plans_path
end

  private

  def plans_params
    params.permit(plans: [:attendance, :comment, :start_time, :child_id])[:plans]
   end

  def set_start_date
    if params[:start_date].present?
      @start_date = params[:start_date].to_date
    else
      @start_date = Date.today
    end
  end
  # シンプルカレンダーの現在の月の日付以外にフォームを表示しないため

  def current_user_children
    @user = current_user
    @children = Child.where(family_id: @user.family_id)
  end
end
