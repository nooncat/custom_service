class Cabinet::Sellings::SellingItemsController < Cabinet::ApplicationController
  before_action :set_resource, only: [:edit, :update, :destroy]
  before_action :set_parent

  def new
    @resource = @parent.selling_items.build
  end

  def edit
  end

  def create
    @resource = @parent.selling_items.build(permitted_params)

    if @resource.save
      redirect_to [:cabinet, @parent, :sellings], notice: 'Реализация создана.'
    else
      render :new
    end
  end

  def update
    if @resource.update(permitted_params)
      redirect_to [:cabinet, @parent, :sellings], notice: 'Реализация обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to [:cabinet, @parent, :sellings], notice: 'Реализация удалена.'
  end

  private

  def set_parent
    @parent = TemporaryStorageWarehouseTransaction.find params[:temporary_storage_warehouse_transaction_id]
  end

  def set_resource
    @resource = Selling.find(params[:id])
  end

  def permitted_params
    params.require(:selling_item).permit(:description, :quantity, :measure, :price, :nds_percent)
  end
end
