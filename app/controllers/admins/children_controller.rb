class Admins::ChildrenController < ApplicationController
   before_action :authenticate_admin!
  before_action :current_room_family
  def index
    @children = Child.where(family_id: @families).page(params[:page]).reverse_order
  end

  def show
    @child = Child.find(params[:id])
  end

  def room_access
    @children = Child.where(family_id: @families).page(params[:page]).reverse_order
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

  private

  def child_params
    params.require(:child).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :grade, :school_class, :gender, :allergy, :special_notes, :room_access)
  end
  def current_room_family
    @room = current_admin.room
    @families = Family.where(room_id: @room.id)
  end
end
