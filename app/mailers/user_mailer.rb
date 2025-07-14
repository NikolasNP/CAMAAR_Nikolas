# app/mailers/user_mailer.rb
class UserMailer < ApplicationMailer
  def password_reset(user)
    @user = user
    @token = user.signed_id(purpose: "password_reset", expires_in: 1.day)
    mail to: user.email, subject: "Defina sua senha no CAMAAR"
  end
end
