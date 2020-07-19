class InquiriesController < ApplicationController
  def confirm
    @inquiry = Inquiry.new(inquiry_params)
    render 'home/top' if @inquiry.invalid?
  end

  def create
    @inquiry = Inquiry.new(inquiry_params)
    render('home/top') && return if params[:back] || !@inquiry.save
    InquiryMailer.send_mail(@inquiry).deliver_later
    redirect_to root_path
    flash[:notice] = "お問い合わせありがとうございました。"
end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :phone_number, :message)
  end
end
