class Users::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check
  before_action :current_user_children
  def index
    @plans = Plan.where(child_id: @children.ids)
    if params[:start_date].present?
      @start_date = params[:start_date].to_date
    else
      @start_date = Date.today
    end
  end

  def new
    @plans = PlanCollection.new
    if params[:start_date].present?
      @start_date = params[:start_date].to_date
    else
      @start_date = Date.today
    end
end

  def create
    @child = Child.find_by(id: params[:plan_collection][:child_id])
    @plans = PlanCollection.new(plans_params)
    @plans.collection.each do |plan|
      plan.child_id = @child.id
    end
    if @plans.save
      flash[:success] = "登録が完了しました。"
      redirect_to users_plans_path
    else
      flash[:warning] = "既に登録済みです。変更する際には編集を行ってください。"
      render :index
    end
end

  def edit
    @child = Child.find_by(id: params[:id])
    @plans = Plan.where(child_id: @child.id)
  end

  def update
    @child = Child.find_by(id: params[:id])
    if params[:plans].present?
      @plans = plans_params.keys.each do |id|
        plan = Plan.find(id)
        plan.update_attributes(plans_params[id])
        plan
      end
      flash[:success] = "編集が完了しました。"
      redirect_to users_plans_path

    else
      flash[:warning] = "まだ未作成です。新規作成してください。"
      render :index
  end
end

  private

  def plans_params
    params.permit(plans: [:attendance, :comment, :start_time])[:plans]
   end

  def plan_params
    params.require(:plans).permit(:attendance, :comment)
  end

  def current_user_children
    @user = current_user
    @children = Child.where(family_id: @user.family_id)
  end
end
