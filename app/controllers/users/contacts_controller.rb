class Users::ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :current_room, only: [:index, :show]
  before_action :child_check, only: [:index, :show]
  def index
    @q = Contact.where(room_id: @room).page(params[:page]).reverse_order.ransack(params[:q])
    @contacts = @q.result(distinct: true)
  end
  def read
    if ContactUser.create(contact_id: params[:id], user_id: current_user.id)
      @contact_user = ContactUser.update(read: true)
    end
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
