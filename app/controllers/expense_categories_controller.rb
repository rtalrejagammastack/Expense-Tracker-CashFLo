# frozen_string_literal: true

# Expense Categories operations
class ExpenseCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category
  before_action :find_expense_category, only: %i[show edit update destroy]

  def index
    @expense_categories = @user_category.expense_categories
    @expense_sub_categories = @user_category.expense_subcategories_by_expense_category_hash
  end

  def new
    @expense_category = @user_category.expense_categories.build
  end

  def create
    @expense_category = @user_category.expense_categories.new(expense_category_params)

    if @expense_category.save
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: I18n.t('activerecord.model.expense_category.create.success', name: @expense_category.name) 
    else
      render :new, status: :unprocessable_entity, alert: I18n.t('activerecord.model.expense_category.create.error', name: @expense_category.name)
    end
  end

  def show
    @expense_sub_categories = @expense_category.sub_categories
  end

  def edit
  end

  def update
    if @expense_category.update(expense_category_params)
      redirect_to user_category_expense_category_path(@user_category, @expense_category), notice: I18n.t('activerecord.model.expense_category.update.success', name: @expense_category.name)
    else
      render :edit, status: :unprocessable_entity, alert: I18n.t('activerecord.model.expense_category.update.error', name: @expense_category.name)
    end
  end

  def destroy
    if @expense_category.destroy
      redirect_to user_category_expense_categories_path(@user_category), notice: I18n.t('activerecord.model.expense_category.destroy.success', name: @expense_category.name)
    else
      redirect_to user_category_expense_categories_path(@user_category), notice: I18n.t('activerecord.model.expense_category.destroy.error', name: @expense_category.name)
    end
  end

  private

  def expense_category_params
    params.require(:expense_category).permit(:name)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find(params[:user_category_slug])
  end

  def find_expense_category
    @expense_category = ExpenseCategory.friendly.find(params[:slug])
  end
end
