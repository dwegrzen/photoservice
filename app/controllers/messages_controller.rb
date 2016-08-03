class MessagesController < ApplicationController

  def reply
    message_body = params["Body"]
    from_number = params["From"]
    photo = Photo.create!(
      remote_image_url: params["MedialUrl0"],
      caption: params["Body"],
      from_email: "#{params["From"]}@twillio",
      mobileurl: params["MediaUrl0"]
    )
    Pusher.trigger('photos', 'new_photo', PhotoSerializer.new(photo).as_json)


    boot_twilio
    sms = @client.messages.create(
      from: ENV['twilio_number'],
      to: from_number,
      body: "Your text and photo has been received, thank you. Your number is #{from_number}."
    )
  end

  private

    def boot_twilio
      account_sid = ENV['twilio_sid']
      auth_token = ENV['twilio_token']
      @client = Twilio::REST::Client.new account_sid, auth_token
    end

end
