class UserMailer < ApplicationMailer

  def daily_transaction_email(user, pdf)
    @user = user
    attachments['transactions.pdf'] = pdf.render
    mail(to: @user.email, subject: "Daily Transactions Report")
  end
end
