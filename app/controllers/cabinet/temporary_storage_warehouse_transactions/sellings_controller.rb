class Cabinet::TemporaryStorageWarehouseTransactions::SellingsController < Cabinet::ApplicationController
  before_action :set_parent
  before_action :set_resource, only: [:edit, :update, :destroy]

  def new
    @resource = @parent.build_selling(default_params)
  end

  def edit
  end

  def create
    @resource = @parent.build_selling(permitted_params)

    if @resource.save
      redirect_to [:edit, :cabinet, @parent, @resource], notice: 'Реализация создана.'
    else
      render :new
    end
  end

  def update
    if @resource.update(permitted_params)
      redirect_to [:edit, :cabinet, @parent, @resource], notice: 'Реализация обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to [:edit, :cabinet, @parent, @resource], notice: 'Реализация удалена.'
  end

  private

  def default_params
    {
      company_name: @parent.company.name,
      num: Selling.where(temporary_storage_warehouse_id: current_user.temporary_storage_warehouse_id).count + 1,
      agreement_num: @parent.company.agreement_num,
      date: Time.zone.now,
      planned_payment_date: Time.zone.now + @parent.company.deferment_of_payment.to_i.days
    }
  end

  def set_parent
    @parent = TemporaryStorageWarehouseTransaction.find params[:temporary_storage_warehouse_transaction_id]
  end

  def set_resource
    @resource = @parent.selling
  end

  def permitted_params
    {
      temporary_storage_warehouse_id: current_user.temporary_storage_warehouse.id
    }.merge params.require(:selling).permit(:payed, :company_name, :num, :agreement_num, :date, :planned_payment_date)
  end
end
