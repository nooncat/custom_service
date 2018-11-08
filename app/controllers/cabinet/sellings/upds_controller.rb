class Cabinet::Sellings::UpdsController < Cabinet::ApplicationController
  def create
    send_file Rails.root.join('public', 'docs', 'upd.pdf')
  end
end
