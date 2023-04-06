# frozen_string_literal: true

# Expense Sub Categories operations
class ExpenseSubCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category
  before_action :find_expense_category
  before_action :find_expense_sub_category, only: %i[edit update destroy]

  def new
    @expense_sub_category = @expense_category.sub_categories.new
  end

  def create
    @expense_sub_category = @expense_category.sub_categories.new(expense_sub_category_params)

    if @expense_sub_category.save
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Expense-sub category was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'Expense-sub category was unable to create.'
    end
  end

  def edit
  end

  def update
    if @expense_sub_category.update(expense_sub_category_params)
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Expense-sub category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, alert: 'Expense-sub category was unable to update.'
    end
  end

  def destroy
    if @expense_sub_category.destroy
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Expense-sub category was successfully deleted.'
    else
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: 'Expense-sub category was unable to destroy.'
    end
  end

  private

  def expense_sub_category_params
    params.require(:expense_sub_category).permit(:name).merge(user_category_id: @user_category.id)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find(params[:user_category_slug])
  end

  def find_expense_category
    @expense_category = ExpenseCategory.friendly.find(params[:expense_category_slug])
  end

  def find_expense_sub_category
    @expense_sub_category = ExpenseSubCategory.friendly.find(params[:slug])
  end
end
