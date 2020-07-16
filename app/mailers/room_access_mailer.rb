class RoomAccessMailer < ApplicationMailer
  def enter_mail
    @user = params[:user]
    @room = params[:room]
    @child = params[:child]
    mail(to: @user.email, subject: "お子様が#{@room.name}へ入室しました")
  end
end
