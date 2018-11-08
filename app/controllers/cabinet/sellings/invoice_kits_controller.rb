class Cabinet::Sellings::InvoiceKitsController < Cabinet::ApplicationController
  def create
    send_file Rails.root.join('public', 'docs', 'invoice_kit.zip')
  end
end
