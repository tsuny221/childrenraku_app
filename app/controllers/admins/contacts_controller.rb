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
      @users = User.where(room_id: @room.id)
      render :new and return if params[:back] || !@contact.save
      @users.each do |user|
        ContactMailer.with(user: user).send_mail(@contact).deliver_now
      end
      redirect_to admins_contacts_path
      flash[:success] = "連絡網を送信いたしました。"
  end

  def index
    @q = Contact.where(room_id: @room).page(params[:page]).reverse_order.ransack(params[:q])
    @contacts =@q.result(distinct: true)
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :text, :image, :file, :room_id, :created_at)
  end

  def current_room
    @room = current_admin.room
  end
end
