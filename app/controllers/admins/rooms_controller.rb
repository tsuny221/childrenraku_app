class Admins::RoomsController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check, only: [:edit, :update]
  def new
    @room = Room.new
  end

  def create
    @room = Room.new(room_params)
    @room.admin_id = current_admin.id
    if @room.save
      redirect_to admins_top_path
      flash[:notice] = "ルームの作成が完了しました"
    else
      render :new
    end
  end
  def edit
    @room = current_admin.room
  end

  def update
    @room = current_admin.room
    if @room.update(room_params)
      redirect_to admins_admin_path(current_admin)
      flash[:notice] = "ルームの編集が完了しました"
    else
      render :edit
    end
  end

  private

  def room_params
    params.require(:room).permit(:name, :key)
  end
end
