class Admins::UsersController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  before_action :current_room_families
  def show
    @user = User.find(params[:id])
    @children = Child.where(family_id: @user.family_id)
    @users = User.where(family_id: @user.family_id).where.not(id: @user)
  end

  def index
    @q = User.where(room_id: @room.id).page(params[:page]).reverse_order.ransack(params[:q])
    @users = @q.result(distinct: true)
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :addresss, :phone_numeber)
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admins_users_path
    flash[:notice] = "会員の削除が完了しました。"
  end

  def current_room_families
    @room = current_admin.room
    @families = Family.where(room_id: @room.id)
  end
end
