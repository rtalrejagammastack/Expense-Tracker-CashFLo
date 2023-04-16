# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# TransactionStatus.create([{name:"Complete"},{name:"Pending"}])

# TransactionType.create([{name:"Expense"},{name:"Income"}])

# TransactionMode.create([{name:"Cash"},{name:"Upi"},{name:"Debt Card"},{name:"Credit Card"}])

require 'faker'

# # Generate 50 random transactions
500.times do
  amount = Faker::Number.between(from: 100, to: 2000)
  description = Faker::Lorem.paragraph
  payer_name = "Fake"
  payee_name = Faker::Name.name
  category = 26
  expense_sub_category = Faker::Number.between(from: 30, to: 31)
  status = Faker::Number.between(from: 11, to: 12)
  type = Faker::Number.between(from: 5, to: 6)
  mode = Faker::Number.between(from: 9, to: 12)
  created_at = Faker::Date.between(from: 1.year.ago, to: Date.today)
  Transaction.create!(amount: amount, description: description, payer_name: payer_name, payee_name: payee_name, user_category_id: category, expense_sub_category_id: expense_sub_category, status_id: status, type_id: type, mode_id: mode, created_at: created_at)
end



# Remove user_category from expense sub category
# removve payer id and payee id from transactions


# redirect_to paths 
# errors and notice
# locale at everywhere
# Remove instance variable from everywhere
# Naming issue of new/create in forms