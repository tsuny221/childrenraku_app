class Admins::RoomsController < ApplicationController
  before_action :authenticate_admin!
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.admin_id = current_admin.id
    if @room.save
      redirect_to root_path
      flash[:notice] = "ルームの作成が完了しました"
    else
    render :new
    end
  end

  private
  def room_params
  params.require(:room).permit(:name, :key)
  end
end
