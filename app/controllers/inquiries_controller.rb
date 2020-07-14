class InquiriesController < ApplicationController
  def confirm
     @inquiry = Inquiry.new(inquiry_params)
     render 'home/top' if @inquiry.invalid?
  end
  def create
    @inquiry = Inquiry.new(inquiry_params)
    render 'home/top' and return if params[:back] || !@inquiry.save
      InquiryMailer.send_mail(@inquiry).deliver_now
      redirect_to root_path
      flash[:success] = "お問い合わせを送信いたしました。"
end

  private

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :phone_number, :message)
  end
end
