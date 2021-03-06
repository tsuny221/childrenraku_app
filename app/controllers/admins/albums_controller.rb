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
      @album.images.each do |image|
        tags = Vision.get_image_data(image)
        tags.each do |tag|
          @album.tags.create(name: tag)
        end
      end
      redirect_to admins_albums_path
      flash[:success] = "アルバムを作成しました。"
    else
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    # アルバムに画像が存在して、かつ、選択した画像がある場合その画像を削除
    if @album.images.attached? && !params[:album][:image_ids].nil?
      params[:album][:image_ids].each do |image_id|
        image = @album.images.find(image_id)
        image.purge
      end
    end
    # 新たに登録した画像の更新
    if @album.update(album_params)
      @album.images.each do |image|
        tags = Vision.get_image_data(image)
        tags.each do |tag|
          @album.tags.create(name: tag)
        end
      end
      redirect_to admins_albums_path
      flash[:success] = "アルバムを編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    @album.destroy
    redirect_to admins_albums_path
    flash[:success] = "アルバムを削除しました。"
  end

  private

  # ActiveStorageを利用して複数画像の保存
  def album_params
    params.require(:album).permit(:name, :room_id, images: [])
  end

  def current_room
    @room = current_admin.room
  end
end
