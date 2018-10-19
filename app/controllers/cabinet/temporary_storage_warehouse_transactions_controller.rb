class Cabinet::TemporaryStorageWarehouseTransactionsController < Cabinet::ApplicationController
  before_action :set_resource, only: [:edit, :update]

  def index
    @collection = TemporaryStorageWarehouseTransaction.all.order(id: :desc)
  end

  def new
    @resource = TemporaryStorageWarehouseTransaction.new
  end

  def create
    @resource = TemporaryStorageWarehouseTransaction.new(permitted_params)

    if @resource.save
      redirect_to [:edit, :cabinet, @resource], notice: 'Транспортное средство создано.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resource.update(permitted_params)
      redirect_to [:edit, :cabinet, @resource], notice: 'Транспортное средство обновлено.'
    else
      render :edit
    end
  end

  private

  def set_resource
    @resource = TemporaryStorageWarehouseTransaction.find(params[:id])
  end

  def permitted_params
    params.require(:temporary_storage_warehouse_transaction).permit(
      :user_id, :company_id, :vehicle_number, :vehicle_type, :state, :pallet_count, :date,
      :checkin_date, :checkin_notifie, :checkout_date, :checkout_notifie, :phone, :deal_typ, :country_code,
      :planned_payment_date, :payed
    )
  end
end
