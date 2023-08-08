class PictMailer < ApplicationMailer
  def contact_mail(picture)
    @picture = picture

    mail to: @picture.user.email, subject: "写真投稿確認メール"
  end
end
