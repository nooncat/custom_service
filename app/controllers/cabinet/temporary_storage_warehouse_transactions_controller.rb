class Cabinet::TemporaryStorageWarehouseTransactionsController < Cabinet::ApplicationController
  def index
    @collection = TemporaryStorageWarehouseTransaction.all
  end

  def new
    @resource = TemporaryStorageWarehouseTransaction.new
  end

  def create
    @resource = TemporaryStorageWarehouseTransaction.new(permitted_params)

    if @resource.save
      redirect_to [:cabinet, :temporary_storage_warehouse_transactions], notice: 'Транспортное средство создано'
    else
      render :new
    end
  end

  def edit
    @resource = TemporaryStorageWarehouseTransaction.find(params[:id])
  end

  private

  def permitted_params
    params.require(:temporary_storage_warehouse_transaction).permit(
      :company_id, :vehicle_number, :vehicle_type, :state, :pallet_count, :date,
      :checkin_date, :checkin_notifie, :checkout_date, :checkout_notifie, :phone, :deal_typ, :country_code
    )
  end
end
