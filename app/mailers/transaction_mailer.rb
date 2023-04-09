class TransactionMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.transaction_mailer.new_transaction.subject
  #
  def new_transaction(transaction, current_user)
    @transaction = transaction
    @user = current_user

    mail to: @user.email, subject: I18n.t("en.transaction_mailer.new_transaction.subject")
  end
end
