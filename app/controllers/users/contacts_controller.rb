class Users::ContactsController < ApplicationController
  before_action :current_room
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
    @room = current_user.room
  end
end