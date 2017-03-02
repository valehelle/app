class CustomerMailer < ApplicationMailer
  default from: 'visualreceipt@gmail.com.com'
 
  def receipt_email(email)
    @url  = 'http://example.com/login'
    mail(to: email, subject: 'Welcome to My Awesome Site')
  end
end
