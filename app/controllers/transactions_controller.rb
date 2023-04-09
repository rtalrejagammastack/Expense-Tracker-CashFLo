# frozen_string_literal: true

# Transaction operations
class TransactionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category
  before_action :find_transaction, only: %i[edit update destroy show]
  before_action :fetch_transaction_form_data, only: %i[new edit]
  
  def index
    @all_transactions = @user_category.transactions
    fetch_filter_parameters
    @types_options = TransactionType.map_slug_with_name
    @status_options = TransactionStatus.map_slug_with_name
    @modes_options = TransactionMode.map_slug_with_name
    @q = @all_transactions.ransack(params[:q])
    @transactions_per_page = @q.result.paginate(page: params[:page]) 
    @transactions = @transactions_per_page.create_hash_transactions_group_by_date
  end

  def new
    @transaction = @user_category.transactions.new
  end

  def create
    @transaction = @user_category.transactions.new(transaction_params)

    if @transaction.save!
      redirect_to user_category_transaction_path(@user_category, @transaction), notice: 'Transaction was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Transaction was unable to create.'
    end
  end

  def edit
  end

  def show
  end

  def update
    if @transaction.update(transaction_params)
      redirect_to user_category_transaction_path(@user_category, @transaction), notice: 'Transaction was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, alert: 'Transaction was unable to update.'
    end
  end

  def destroy
    if @transaction.destroy
      redirect_to user_category_transactins_path(@user_category), notice: 'Transaction was successfully deleted.'
    else
      redirect_to user_category_transactins_path(@user_category), alert: 'Transaction Deletion Failed.'
    end
  end

  def fetch_expense_sub_categories
    expense_category = current_user.expense_categories.find(params[:id])
    options = expense_category.sub_categories
    render json: options.to_json(only: %i[name id])
  end

  private

  def fetch_transaction_form_data
    @transaction_types = TransactionType.all
    @transaction_type = TransactionType.where('name=?', params[:type]).first || TransactionType.first
    @types_options = TransactionType.map_id_with_name
    @status_options = TransactionStatus.map_id_with_name
    @modes_options = TransactionMode.map_id_with_name
    @expense_categories = @user_category.expense_categories.map_id_with_name
  end

  def transaction_params
    params.require(:transaction).permit(:payee_name, :payer_name, :amount, :status_id, :mode_id, :expense_sub_category_id, :description, :type_id, documents: [])
  end

  def fetch_filter_parameters
    @type = TransactionType.friendly.find(params[:type]) if params[:type].present?
    @status = TransactionStatus.friendly.find(params[:status]) if params[:status].present?
    @mode = TransactionMode.friendly.find(params[:mode]) if params[:mode].present?
    @all_transactions = @all_transactions.where(type: @type) if params[:type].present?
    @all_transactions = @all_transactions.where(status: @status) if params[:status].present?
    @all_transactions = @all_transactions.where(mode: @mode) if params[:mode].present?
  end

  def find_user_category
    @user_category = UserCategory.friendly.find(params[:user_category_slug])
  end

  def find_transaction
    @transaction = Transaction.friendly.find(params[:slug])
  end
end
