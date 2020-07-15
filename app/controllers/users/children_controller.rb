class Users::ChildrenController < ApplicationController
  before_action :authenticate_user!
  before_action :child_check, only: [:index, :show, :edit, :update]
  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    @child.user_id = current_user.id
    @child.family_id = current_user.family_id
    if @child.save
      redirect_to users_user_path(current_user)
      flash[:success] = "お子様の情報を登録しました。"
    else
      render :new
    end
  end

  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @user = current_user
    @child = Child.find(params[:id])
    if @child.update(child_params)
      redirect_to users_user_path(current_user)
      flash[:success] = "お子様の情報を編集しました。"
    else
      render :edit
    end
  end

  # def destroy
  #   @child = Child.find(params[:id])
  #   @child.destroy
  #   flash[:notice] = "お子様の情報を削除完了いたしました。"
  #   redirect_to users_children_path
  # end

  private

  def child_params
    params.require(:child).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :grade, :school_class, :gender, :allergy, :special_notes, :room_access)
  end
end
