class Admins::ChildrenController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  before_action :current_room_families
  before_action :children_enter, only: [:enter, :leave]

  def index
    @q = Child.order(grade: "DESC").where(family_id: @families).page(params[:page]).ransack(params[:q])
    @children = @q.result(distinct: true)
    @boy = Child.where(family_id: @families).where(gender: 1)
    @girl = Child.where(family_id: @families).where(gender: 2)
  end

  def show
    @child = Child.find(params[:id])
    @user = User.find_by(id: @child.user_id)
    @children = Child.where(family_id: @user.family_id)
    @users = User.where(family_id: @child.family_id).where.not(id: @user)
  end

  # 入退室管理ページ
  def room_access
    @q = Child.order(grade: "DESC").where(family_id: @families).page(params[:page]).ransack(params[:q])
    @children = @q.result(distinct: true)
    @enter = Child.where(family_id: @families).where(room_access: 1)
    @plans = Plan.where(start_time: Date.today.beginning_of_day)
  end

  def enter
    @child.update(room_access: true)
    # 非同期化
    # redirect_to admins_room_access_path(@child)
  end

  def leave
    @child.update(room_access: false)
    # 非同期化
    # redirect_to admins_room_access_path(@child)
  end

  def mail
    @child = Child.find_by(id: params[:child][:id])
    @users = User.where(family_id: @child.family_id)
    @users.each do |user|
      if @child.room_access == "入室"
        RoomAccessMailer.with(user: user, child: @child, room: @room).enter_mail.deliver_later
      else
        RoomAccessMailer.with(user: user, child: @child, room: @room).leave_mail.deliver_later
      end
    end
  end

  def mail_all
    @children = Child.where(room_access: true).where(family_id: @families)
    if @children.present?
      @children.each do |child|
        @users = User.where(family_id: child.family_id)
        @users.each do |user|
          RoomAccessMailer.with(user: user, child: child, room: @room).enter_mail.deliver_later
        end
      end
      redirect_to admins_room_access_path
      flash[:success] = "入室メールを一括送信いたしました。"
    else
      @q = Child.order(grade: "DESC").where(family_id: @families).page(params[:page]).ransack(params[:q])
      @children = @q.result(distinct: true)
      @enter = Child.where(family_id: @families).where(room_access: 1)
      @plans = Plan.where(start_time: Date.today.beginning_of_day)
      flash.now[:alert] = "入室している児童がいません。"
      render :room_access
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

  def children_enter
    @child = Child.find_by(id: params[:child][:id])
    @enter = Child.where(family_id: @families).where(room_access: 1)
    @children = Child.where(family_id: @families)
  end
end
