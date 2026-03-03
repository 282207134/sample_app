# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/account_activation
  def account_activation
    user = User.first
    user.activation_token = User.new_token
    UserMailer.account_activation(user)
  end

  # Preview this email at
  # http://localhost:3000/rails/mailers/user_mailer/password_reset
  def password_reset
    user = User.first
    user.reset_token = User.new_token
    # 把 digest 写入数据库，这样点击预览邮件中的链接时 token 能通过校验
    user.update_columns(
      reset_digest: User.digest(user.reset_token),
      reset_sent_at: Time.zone.now
    )
    UserMailer.password_reset(user)
  end
end
