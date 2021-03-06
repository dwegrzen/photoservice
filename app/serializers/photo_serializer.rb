class PhotoSerializer < ActiveModel::Serializer
  attributes :id, :caption, :from_email, :image_url, :custom1, :custom2, :custom3, :custom4, :custom5, :custom6

  def image_url
    if object.smsstatus == "received"
      object.mobileurl
    else
      object.email_image_url
    end
  end

  def custom1
    Refile.attachment_url( object, :email_image, :fil, 50, 50, format: "jpg")
  end

  def custom2
    Refile.attachment_url( object, :email_image, :fit, 100, 100, format: "jpg")
  end

  def custom3
    Refile.attachment_url( object, :email_image, :fit, 250, 250, format: "jpg")
  end

  def custom4
    Refile.attachment_url( object, :email_image, :fit, 500, 500, format: "jpg")
  end

  def custom5
    Refile.attachment_url( object, :email_image, :fit, 1000, 1000, format: "jpg")
  end

  def custom6
    Refile.attachment_url( object, :email_image, :fit, 250, 500, format: "jpg")
  end


end
