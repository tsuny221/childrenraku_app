class Users::ChildrenController < ApplicationController
  before_action :authenticate_user!
  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @child.user_id = current_user.id
    @child.family_id = current_user.family_id
    if @child.save
      redirect_to users_children_path
      flash[:notice] = "お子様の情報を登録完了いたしました。"
    else
      render :new
    end
  end

  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])
    if @child.update
      redirect_to users_child_path(@child)
      flash[:notice] = "お子様の情報を編集完了いたしました。"
    else
      render :edit
    end
  end

  def destroy
    @child = Child.find(params[:id])
    @child.destroy
    flash[:notice] = "お子様の情報を削除完了いたしました。"
    redirect_to users_children_path
  end

  private

  def child_params
    params.require(:child).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :grade, :school_class, :gender, :allergy, :special_notes, :room_access)
  end
end
