class InquiriesController < ApplicationController
  def create
   @inquiry = Inquiry.new(inquiry_params)
   if @inquiry.save
    InquiryMailer.send_mail(@inquiry).deliver_now
    redirect_to root_path
    flash[:success] = "お問い合わせを送信いたしました。"
   else
    render 'home/top'
    flash[:danger] = "お問い合わせに失敗しました。再度送信してください。"
  end
end

 private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :phone_number, :message)
  end
end
