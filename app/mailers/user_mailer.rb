class UserMailer < ApplicationMailer
  default from: 'drhalterman1@yahoo.com'

  def new_record_notification(record)
    @record = record
    mail to: "drhalterman1@yahoo.com", subject: "Email successful!"
  end
end
