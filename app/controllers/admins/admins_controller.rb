class Admins::AdminsController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  def show
    @admin = current_admin
    @room = @admin.room
  end
   def edit
    @admin = current_admin
    @room = @admin.room
  end
   def update
    @admin = current_admin
    @room = @admin.room
    if @admin.update(admin_params)
      redirect_to admins_admin_path(@admin.id)
      flash[:notice] = "管理者情報を編集いたしました。"
    else
      render :edit
    end
  end
  def confirm
     @admin = current_admin
  end
   def hide
        @admin = Admin.find(params[:id])
        #is_deletedカラムにフラグを立てる(defaultはfalse)
        @room = current_admin.room
        @room.destroy
        @admin.update(is_deleted: true)
        #ログアウトさせる
        reset_session
        flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
        redirect_to root_path
    end
  private
  def admin_params
    params.require(:admin).permit(:name, :email, :password)
  end
end
