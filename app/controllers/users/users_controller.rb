class Users::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check
  def show
    @user = current_user
    @children = Child.where(family_id: @user.family_id)
    @users = User.where(family_id: @user.family_id).where.not(id: current_user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_user_path(@user)
      flash[:success] = "ユーザー情報を編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @user = current_user
    @child = Child.find_by(id: params[:id])
    @child.destroy
    flash[:notice] = "お子様の情報を削除しました"
    redirect_to users_user_path(@user)
  end

  def confirm
    @user = current_user
  end

  def hide
    @user = User.find(params[:id])
    # is_deletedカラムにフラグを立てる(defaultはfalse)
    @user.update(is_deleted: true)
    # ログアウトさせる
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
    end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :postcode, :addresss, :phone_numeber)
  end
end
