class Users::ContactsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :current_room, only: [:index, :show]
  before_action :child_check, only: [:index, :show]
  def index
    @groups = current_user.groups
    @q = Contact.where(group_id: @groups.ids).or(Contact.where(group_id: nil)).page(params[:page]).reverse_order.ransack(params[:q])
    @contacts = @q.result(distinct: true)
  end
  def read
    # 既読機能
    if ContactUser.create(contact_id: params[:id], user_id: params[:user_id], read: true).valid?
    else
      @contact = Contact.find(params[:id])
      flash[:notice] = "既に既読済みです。"
      render :show
    end
  end

  def show
    @contact = Contact.find(params[:id])
  end

  private

  def contact_params
    params.require(:contact).permit(:subject, :text, :image, :file, :room_id, :group_id)
  end

  def current_room
    @room = current_user.room
  end

end
