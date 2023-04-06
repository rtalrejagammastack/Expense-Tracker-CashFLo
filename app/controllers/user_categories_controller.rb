# frozen_string_literal: true

# User Categories operations
class UserCategoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user_category, only: %i[edit show update destroy]

  def index
    @user_categories = current_user.categories
  end

  def new
    @user_category = UserCategory.new
  end

  def create
    @user_category = current_user.categories.new(category_params)
    if @user_category.save
      redirect_to user_category_path(@user_category), notice: 'User category was successfully created.'
    else
      render :new, status: :unprocessable_entity, alert: 'User category was unable to create.'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user_category.update(category_params)
      redirect_to user_category_path(@user_category), notice: 'User category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity, alert: 'User category was unable to update.'
    end
  end

  def destroy
    if @user_category.destroy
      redirect_to user_categories_path, notice: 'User category was successfully deleted.'
    else
      redirect_to @user_category, alert: 'User category was unable to destroy.'
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
