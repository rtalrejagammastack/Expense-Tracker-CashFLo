require 'rails_helper'

RSpec.describe UserCategory, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:user_category, user: user) }

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:expense_categories).dependent(:destroy) }
    it { should have_many(:expense_sub_categories).through(:expense_categories).source(:sub_categories) }
    it { should have_many(:transactions) }
  end

  describe 'callbacks' do
    it 'capitalizes the first letter of the name before saving' do
      category = create(:user_category, user: user, name: 'test category')
      expect(category.name).to eq('Test category')
    end
  end

  describe 'methods' do
    it 'returns a hash of expense subcategories grouped by expense category' do
      subcategories_by_expense_category = category.expense_subcategories_by_expense_category_hash
      expect(subcategories_by_expense_category).to be_a(Hash)
      expect(subcategories_by_expense_category).to have_key(expense_category.id)
      expect(subcategories_by_expense_category[expense_category.id]).to eq(sub_category.name)
    end
  end
end
