# frozen_string_literal: true

# User Categories operations
class UserCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category, only: %i[edit show update destroy]

  def index
    @user_categories = current_user.categories
  end

  def new
    @user_category = current_user.categories.build
  end

  def create
    @user_category = current_user.categories.build(category_params)
    if @user_category.save
      redirect_to user_category_path(@user_category), notice: I18n.t("activerecord.model.user_category.create.success", name: @user_category.name) 
    else
      render :new, status: :unprocessable_entity, alert: I18n.t("activerecord.model.user_category.create.error", name: @user_category.name)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user_category.update(category_params)
      redirect_to user_category_path(@user_category), notice: I18n.t("activerecord.model.user_category.update.success", name: @user_category.name)
    else
      render :edit, status: :unprocessable_entity, alert: I18n.t("activerecord.model.user_category.update.error", name: @user_category.name)
    end
  end

  def destroy
    if @user_category.destroy
      redirect_to user_categories_path, notice: I18n.t("activerecord.model.user_category.destroy.success", name: @user_category.name)
    else
      redirect_to user_category_path(@user_category), alert: I18n.t("activerecord.model.user_category.destroy.error", name: @user_category.name)
    end
  end

  private

  def category_params
    params.require(:user_category).permit(:name, :background)
  end

  def find_user_category
    @user_category = UserCategory.friendly.find(params[:slug])
  end
end
