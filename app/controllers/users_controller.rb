class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(@user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user == current_user
      if params[:user][:pass_edit] == "0"
        result = @user.update(update_user_params_without_pass)
      else
        result = @user.update(update_user_params)
      end
      if result
        redirect_to user_path(@user), notice: "ユーザー情報を更新しました。"
      else
        render :edit
      end
    else
      redirect_to user_path(@user), alert: "他のユーザーの情報を編集することはできません。"
    end
  end

  def withdraw_confirm
  end

  def withdraw
    current_user.destroy
    redirect_to root_path
  end

  private
  def update_user_params_without_pass
    params.require(:user).permit(:name, :email)
  end
  def update_user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
