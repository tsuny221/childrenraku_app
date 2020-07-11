class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :current_room
  def show
    @user = User.find(params[:id])
    @children = Child.where(family_id: @user.family_id)
    @users = User.where(family_id: @user.family_id).where.not(id: @user)
  end
  def index
     @users = User.where(room_id: @room.id).page(params[:page]).reverse_order
  end
  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :addresss, :phone_numeber)
  end
  def current_room
    @room = current_admin.room
  end
end
