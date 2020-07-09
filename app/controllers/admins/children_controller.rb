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
    @child = Child.find_by(id: params[:id])
  end

  def enter
    @child = Child.find_by(id: params[:child][:id])
    #ここ要注意パラメータよくみようchildの中に引き渡されている
    @child.update(room_access: true)
    #redirect_to admins_room_access_path(@child)
  end
  def leave
    @child = Child.find_by(id: params[:child][:id])
    #ここ要注意パラメータよくみようchildの中に引き渡されている
    @child.update(room_access: false)
    #redirect_to admins_room_access_path(@child)
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
