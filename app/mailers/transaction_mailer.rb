class TransactionMailer < ApplicationMailer

  def new_transaction(transaction, current_user)
    @transaction = transaction
    @user = current_user

    mail to: @user.email, subject: I18n.t("transaction_mailer.new_transaction.subject")
  end
end
