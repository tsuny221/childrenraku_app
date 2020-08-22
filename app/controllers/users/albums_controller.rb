class Users::AlbumsController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check
  before_action :current_room

  def index
    @q = Album.where(room_id: @room.id).page(params[:page]).ransack(params[:q])
    @albums = @q.result(distinct: true)
  end

  private

  def current_room
    @room = current_user.room
  end
end
