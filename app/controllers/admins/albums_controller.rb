class Admins::AlbumsController < ApplicationController
  before_action :authenticate_admin!
  before_action :room_check
  before_action :current_room

  def index
    @q = Album.where(room_id: @room.id).page(params[:page]).ransack(params[:q])
    @albums = @q.result(distinct: true)
  end

  def new
    @album = Album.new
  end

  def create
    @album = Album.new(album_params)
    @album.room_id = @room.id
    if @album.save
      @album.images.each do |images|
        tags = Vision.get_image_data(images)
        tags.each do |tag|
          @album.tags.create(name: tag)
        end
     end
      redirect_to admins_albums_path
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.images.attached? && params[:album][:image_ids] != nil
      params[:album][:image_ids].each do |image_id|
          image = @album.images.find(image_id)
          image.purge
     end
    end
    if @album.update(album_params)
    redirect_to admins_albums_path
    else
      render :edit
    end

  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to admins_albums_path
  end

  private

  def album_params
    params.require(:album).permit(:name, :room_id, images: [])
  end
  # ActiveStorageを利用して複数画像の保存
  def current_room
    @room = current_admin.room
  end
end
