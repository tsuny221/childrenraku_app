class RoomAccessMailer < ApplicationMailer
  def enter_mail
    @user = params[:user]
    @room = params[:room]
    @child = params[:child]
    mail(to: @user.email, subject: "お子様が#{@room.name}へ入室しました")
  end
  def leave_mail
    @user = params[:user]
    @room = params[:room]
    @child = params[:child]
    mail(to: @user.email, subject: "お子様が#{@room.name}を退出しました")
  end
end
