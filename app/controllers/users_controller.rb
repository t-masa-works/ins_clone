class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user.id)
    else
      render :new
    end
  end

  def edit
    set_user
  end

  def update
    set_user
    render :edit if @user.invalid?
    if @user.update(user_params)
      redirect_to user_path(@user.id), notice:'保存に成功しました'
    else
      render :edit
    end
  end

  def show
    set_user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
  end
end
