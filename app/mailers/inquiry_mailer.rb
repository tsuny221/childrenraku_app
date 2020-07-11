class InquiryMailer < ApplicationMailer
  def send_mail(inquiry)
		@inquiry = inquiry
		mail(to: @inquiry.email, bcc: 'kingoftsunywork@gmail.com', subject: "お問い合わせ")
	end
end
