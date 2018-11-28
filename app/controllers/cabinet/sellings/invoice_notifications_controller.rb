class Cabinet::Sellings::InvoiceNotificationsController < Cabinet::ApplicationController
  def create
    selling = Selling.find(params[:selling_id])

    selling.invoice_notifications.create

    redirect_to [:cabinet, selling]
  end
end
