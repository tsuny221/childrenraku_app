class Users::UsersController < ApplicationController
   before_action :authenticate_user!
  def show
    @user = current_user
    @children = Child.where(family_id: @user.family_id)
    @users = User.where(family_id: @user.family_id).where.not(id: current_user)
  end
  def edit

  end
  def update

  end
  def destroy
    @user = current_user
    @child = Child.find_by(id: params[:id])
    @child.destroy
    flash[:success] = "児童情報を削除しました"
    redirect_to users_user_path(@user)
  end
end
