class ContactMailer < ApplicationMailer
  def send_mail(contact)
    @contact = contact
    attachments[@contact.image.id] = File.read(Refile.backends['store'].directory + '/' + @contact.image.id)
    @user = params[:user]
		mail(to: @user.email, subject: @contact.subject)
	end
end
