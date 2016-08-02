class EmailProcessor

  def initialize(email)
    @email = email
  end

  def process
    Rails.logger.info @email.attachments.first
    Rails.logger.info @email.inspect


    # all of your application-specific code here - creating models,
    # processing reports, etc

    # here's an example of model creation
    photo = Photo.create!(
      caption: @email.subject,
      body: @email.body,
      from_email: @email.from[:email],
      email_image: @email.attachments.first
    )
    Pusher.trigger('photos', 'new_photo', PhotoSerializer.new(photo).as_json)
    PhotoNotifierMailer.photo_received_email(photo).deliver

  end

  # original method came with something
  # def self.process(email)
  #   Photo.create!({ caption: email.subject, email_from: email.from })
  # end

end
