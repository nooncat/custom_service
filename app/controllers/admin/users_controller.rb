class Admin::UsersController < Admin::ApplicationController
  def index; end

  def resource_class
    User
  end

  def resources
    resource_class.all
  end

  def resource

  end
end
