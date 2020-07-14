class Users::PlansController < ApplicationController
  before_action :authenticate_user!
  before_action :current_user_children
  def index
     @plans = Plan.where(child_id:@children.ids)
     unless params[:start_date].present?
    @start_date = Date.today
    else
    @start_date = params[:start_date].to_date
  end
  end

  def new
    @plans = PlanCollection.new
    unless params[:start_date].present?
    @start_date = Date.today
    else
    @start_date = params[:start_date].to_date
  end
end

  def show
    @plan = Plan.find(params[:id])
  end

  def create
      @child = Child.find_by(id: params[:plan_collection][:child_id])
      @plans = PlanCollection.new(plans_params)
        @plans.collection.each do |plan|
          plan.child_id = @child.id
        end
        if @plans.save
        redirect_to users_plans_path
        flash[:alert] = "登録が完了しました。"
        else
          render :new
          flash[:alert] = "既に登録済みです。変更する際には編集を行ってください。"
        end
  end

  def edit
    @child = Child.find_by(id: params[:id])
    @plans = Plan.where(child_id: @child.id)

  end

  def update
    @child = Child.find_by(id: params[:id])
    @plans = Plan.where(child_id: @child.id)
    @plans = params[:plans]
    if @plans.update_all(params[:plans])
      redirect_to users_plans_path, notice: "編集しました"
    else
      render :edit
  end
end

  private

  def plans_params
    params.require(:plans)
  end

  def plan_params
    params.require(:plans).permit!
  end

  def current_user_children
    @user = current_user
    @children = Child.where(family_id: @user.family_id)
  end
end
