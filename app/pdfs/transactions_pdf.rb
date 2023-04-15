class TransactionsPdf < Prawn::Document
  def initialize(transactions)
    super()
    @transactions = transactions
    generate_pdf
  end

  def generate_pdf
    text "Transactions Report", size: 24, style: :bold, align: :center
    move_down 20

    @transactions.each do |transaction|
      text "Date: #{transaction.created_at}"
      text "Amount: #{transaction.amount}"
      move_down 10
    end
  end
end