class Cabinet::Sellings::InvoicesController < Cabinet::ApplicationController
  def create
    send_file Rails.root.join('public', 'docs', 'invoice.pdf')
  end
end
