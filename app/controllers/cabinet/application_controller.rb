class Cabinet::ApplicationController < ApplicationController
  layout 'cabinet'
  before_action :authenticate
end
