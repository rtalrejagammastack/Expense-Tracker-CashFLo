class DailyTransactionEmailJob < ApplicationJob
  queue_as :default

  def perform
    date = Date.yesterday

    transactions = Transaction.joins(:user_category).where(created_at: date.beginning_of_day..date.end_of_day)

    transactions_by_user = transactions.group_by(&:user_id)

    transactions_by_user.each do |user_id, user_transactions|
      user = User.find_by_id(user_id)

      pdf = TransactionsPdf.new(user_transactions)

      UserMailer.daily_transaction_email(user, pdf).deliver
    end
  end
end
