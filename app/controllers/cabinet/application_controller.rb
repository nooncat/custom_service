class Cabinet::ApplicationController < ApplicationController
  layout 'cabinet'
  before_action :authenticate

  before_action :default_ransack_params, only: [:index]

  def default_ransack_params
    params[:q] ||= {}
    params[:q][:s] ||= 'id desc'
  end
end
