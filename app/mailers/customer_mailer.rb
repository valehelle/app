class CustomerMailer < ApplicationMailer
  default from: 'easyorderreceipt@gmail.com'
 
  def receipt_email(email,name,ref_id)
    @name = name
    @ref_id = ref_id
    mail(to: email, subject: 'Purchase Receipt')
  end
end
