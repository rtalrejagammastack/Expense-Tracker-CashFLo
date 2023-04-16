module TransactionMethods
  extend ActiveSupport::Concern

  def fetch_filter_parameters(user_category)
    all_transactions = user_category.transactions
    if params[:type].present?
      type = TransactionType.friendly.find(params[:type])
      all_transactions = all_transactions.where(type: type)
    end
    if params[:status].present?
      status = TransactionStatus.friendly.find(params[:status])
      all_transactions = all_transactions.where(status: status)
    end
    if params[:mode].present?
      mode = TransactionMode.friendly.find(params[:mode]) 
      all_transactions = all_transactions.where(mode: mode)
    end
    all_transactions
  end
end
