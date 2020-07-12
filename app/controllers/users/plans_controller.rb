class Users::PlansController < ApplicationController
  before_action :current_user_children
  def index
    @plans = Plan.where(child_id: @children).page(params[:page])
  end

  def new
    @plans = PlanCollection.new
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
        else
          render :new
        end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @blog.destroy
    redirect_to users_plans_path, notice: "削除しました"
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def update
    @plan = Plan.find(params[:id])
    if @plan.update(plans_params)
      redirect_to users_plans_path, notice: "編集しました"
    else
      render :edit
    end
  end

  private

  def plans_params
    params.require(:plans)
  end

  def current_user_children
    @user = current_user
    @children = Child.where(family_id: @user.family_id)
  end
end
