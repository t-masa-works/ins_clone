class PictMailer < ApplicationMailer
  def contact_mail(email)
    mail to: email, subject: "写真投稿確認メール"
  end
end
