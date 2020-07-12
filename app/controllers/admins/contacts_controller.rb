class Admins::ContactsController < ApplicationController
  before_action :authenticate_admin!
  before_action :current_room
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.room_id = @room.id
    @users = User.where(room_id: @room.id)
    if @contact.save
      @users.each do |user|
        ContactMailer.with(user: user).send_mail(@contact).deliver_now
      end
      redirect_to admins_contacts_path
      flash[:success] = "連絡網を送信いたしました。"
    else
      render 'contacts/new'
      flash[:danger] = "連絡網の送信に失敗しました。再度送信してください。"
    end
  end

  def index
    @contacts = Contact.where(room_id: @room).page(params[:page]).reverse_order
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :text, :image, :file, :room_id)
  end

  def current_room
    @room = current_admin.room
  end
end
