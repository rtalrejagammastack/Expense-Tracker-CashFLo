# frozen_string_literal: true

# Expense Categories operations
class ExpenseCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category
  before_action :find_expense_category, only: %i[show edit update destroy]

  def index
    @expense_categories = @user_category.expense_categories
  end

  def new
    @expense_category = @user_category.expense_categories.new
  end

  def create
    @expense_category = @user_category.expense_categories.new(expense_category_params)

    if @expense_category.save
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Expense category was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Unable to create Expense Category. Try Again...'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @expense_category.update(expense_category_params)
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Expense category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, alert: 'Unable to update Expense Category. Try Again...'
    end
  end

  def destroy
    if @expense_category.destroy
      redirect_to user_category_expense_categories_path(@user_category), notice: 'Expense category was successfully destroyed.'
    else
      redirect_to user_category_expense_categories_path(@user_category), notice: 'Unable to destroy the Expense category. Try Again....'
    end
  end

  private

  def expense_category_params
    params.require(:expense_category).permit(:name)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find_by_slug(params[:user_category_slug])
  end

  def find_expense_category
    @expense_category = ExpenseCategory.friendly.find_by_slug(params[:slug])
  end
end
