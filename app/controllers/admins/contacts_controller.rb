class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  before_action :current_room
  def new
    @contact = Contact.new
  end

  def confirm
    @contact = Contact.new(contact_params)
    render :new if @contact.invalid?
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.room_id = @room.id
    render(:new) && return if params[:back] || !@contact.save
     if @contact.group_id.present?
      @group = Group.find_by(id: @contact.group_id)
      @group.group_users.each do |group_user|
        ContactMailer.with(user: group_user.user).send_mail(@contact).deliver_later
      end
    else
      @users = User.where(room_id: @room.id)
      @users.each do |user|
        ContactMailer.with(user: user).send_mail(@contact).deliver_later
      end
    end
    #ContactMailer.with(user:current_admin).send_mail(@contact).deliver_later
    redirect_to admins_contacts_path
    flash[:success] = "連絡網を送信いたしました。"
end

  def index
    @q = Contact.where(room_id: @room).page(params[:page]).reverse_order.ransack(params[:q])
    @contacts = @q.result(distinct: true)
    @groups = Group.where(room_id: @room.id)
  end

  def show
    @users = User.where(room_id: @room.id)
    @contact = Contact.find(params[:id])
    @group = Group.find_by(id: @contact.group_id)
    @read_users = @contact.users
    if @group.present?
    @noread_users = @group.users.where.not(id: @contact.users.ids)
    else
    @noread_users = @users.where.not(id: @contact.users.ids)
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :text, :image, :file, :room_id,:group_id, :created_at)
  end

  def current_room
    @room = current_admin.room
  end
end
