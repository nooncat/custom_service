class Cabinet::TemporaryStorageWarehouseTransactions::SellingItemsController < Cabinet::ApplicationController
  before_action :set_selling, only: [:edit, :update, :destroy]
  before_action :set_parent

  def index
    @sellings = @parent.sellings
  end

  def new
    @selling = Selling.new(temporary_storage_warehouse_transaction_id: params[:temporary_storage_warehouse_transaction_id])
  end

  def edit
  end

  def create
    @selling = Selling.new(selling_params)

    if @selling.save
      redirect_to [:cabinet, @parent, :sellings], notice: 'Реализация создана.'
    else
      render :new
    end
  end

  def update
    if @selling.update(selling_params)
      redirect_to [:cabinet, @parent, :sellings], notice: 'Реализация обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @selling.destroy
    redirect_to [:cabinet, @parent, :sellings], notice: 'Реализация удалена.'
  end

  private

  def set_parent
    @parent = TemporaryStorageWarehouseTransaction.find params[:temporary_storage_warehouse_transaction_id]
  end

  def set_selling
    @selling = Selling.find(params[:id])
  end

  def selling_params
    params.require(:selling).permit(:description, :quantity, :measure, :price, :nds_percent).merge(temporary_storage_warehouse_transaction_id: params[:temporary_storage_warehouse_transaction_id])
  end
end
