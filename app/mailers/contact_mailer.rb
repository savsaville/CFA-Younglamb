class ContactMailer < ApplicationMailer

  default from: 'younglambs@lambnation.com.au'

  def send_contact_email(email, message)
    @email = email
    @message = message
    mail(to: 'richardasaville@gmail.com',
             subject: 'New message from YoungLamb') do |format|
          format.html { render 'send_contact_email' }
          # format.text { render 'contact_mailer' }
        end
  end




end
