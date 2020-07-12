class Admins::ChildrenController < ApplicationController
   before_action :authenticate_admin!
  before_action :current_room_families
  def index
    @children = Child.order(grade: "DESC").where(family_id: @families).page(params[:page])
  end

  def show
    @child = Child.find(params[:id])
    @user = User.find_by(id: @child.user_id)
    @children = Child.where(family_id: @user.family_id)
    @users = User.where(family_id: @child.family_id).where.not(id: @user)
  end

  def room_access
    @children = Child.order(grade: "DESC").where(family_id: @families).page(params[:page])
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
  def mail
    @child = Child.find_by(id: params[:child][:id])
    @users = User.where(family_id: @child.family_id)
    @users.each do |user|
      RoomAccessMailer.with(user: user, child: @child, room: @room).enter_mail.deliver_now
    end
  end
  def mail_all
    @children = Child.where(room_access: true).where(family_id: @families)
    if @children.present?
      @children.each do |child|
      @users = User.where(family_id: child.family_id)
      @users.each do |user|
      RoomAccessMailer.with(user: user, child: child, room: @room).enter_mail.deliver_now
      end
    end
    redirect_to admins_room_access_path
    flash[:success] = "お知らせメールを送信いたしました。"
  else
    @children = Child.where(family_id: @families).page(params[:page]).reverse_order
    @child = Child.find_by(id: params[:id])
    render :room_access
    flash[:danger] = "入室している児童がいません。"
  end
  end

  private

  def child_params
    params.require(:child).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :grade, :school_class, :gender, :allergy, :special_notes, :room_access)
  end
  def current_room_families
    @room = current_admin.room
    @families = Family.where(room_id: @room.id)
  end
end
