class Cabinet::UsersController < Cabinet::ApplicationController
  def show
    @user = current_user
  end
end
