class PhotoNotifierMailer < ApplicationMailer
  default :from => 'admin@photostorageserver.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def photo_received_email(photo)
    @user = photo
    mail( :to => @user.from_email,
    :subject => 'Your picture was received' )
  end
end
