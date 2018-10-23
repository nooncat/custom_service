class Cabinet::TemporaryStorageWarehouseTransactionsController < Cabinet::ApplicationController
  before_action :set_resource, only: [:edit, :update]

  def index
    @q = TemporaryStorageWarehouseTransaction.ransack params[:q]
    @collection = @q.result.page(params[:page])
  end

  def new
    @resource = TemporaryStorageWarehouseTransaction.new(default_parmas)
  end

  def create
    @resource = TemporaryStorageWarehouseTransaction.new(permitted_params)

    if @resource.save
      redirect('Транспортное средство создано.')
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @resource.update(permitted_params)
      redirect('Транспортное средство обновлено.')
    else
      render :edit
    end
  end

  private

  def redirect(msg)
    if params[:commit] == 'Сохранить'
      redirect_to [:edit, :cabinet, @resource], notice: msg
    else
      redirect_to [:cabinet, :temporary_storage_warehouse_transactions], notice: msg
    end
  end

  def default_parmas
    {
      user_id: current_user.id,
      date: Time.zone.now,
      checkin_date: Time.zone.now # only for new
    }
  end

  def set_resource
    @resource = TemporaryStorageWarehouseTransaction.find(params[:id])
  end

  def permitted_params
    default_parmas.merge(
      params.require(:temporary_storage_warehouse_transaction).permit(
        :company_id, :vehicle_number, :vehicle_type, :state, :pallet_count,
        :checkin_date, :checkin_notifie, :checkout_date, :checkout_notifie, :phone, :deal_typ, :country_code,
        :planned_payment_date
      )
    )
  end
end
