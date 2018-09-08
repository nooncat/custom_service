class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if user = User.find_by_email(permitted_params[:email]).try(:authenticate, params[:user][:password])
      login(user)
      redirect_to :cabinet_user
    else
      @user = User.new(permitted_params).tap { |e| e.errors.add(:email, 'Пользователь с таким email и паролем не найден')}
    end
  end

  def destroy
    logout
  end

  private

  def permitted_params
    params.require(:user).permit(:email)
  end
end
