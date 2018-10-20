class Cabinet::Sellings::SellingItemsController < Cabinet::ApplicationController
  before_action :set_parent
  before_action :set_resource, only: [:edit, :update, :destroy]

  helper_method :svh_transaction

  def new
    @resource = @parent.selling_items.build
  end

  def edit
  end

  def create
    @resource = @parent.selling_items.build(permitted_params)

    if @resource.save
      redirect_to [:edit, :cabinet, svh_transaction, @parent], notice: 'Услуга создана.'
    else
      render :new
    end
  end

  def update
    if @resource.update(permitted_params)
      redirect_to [:edit, :cabinet, svh_transaction, @parent], notice: 'Услуга обновлена.'
    else
      render :edit
    end
  end

  def destroy
    @resource.destroy
    redirect_to [:edit, :cabinet, svh_transaction, @parent], notice: 'Услуга удалена.'
  end

  private

  def svh_transaction
    @parent.temporary_storage_warehouse_transaction
  end

  def set_parent
    @parent = Selling.find params[:selling_id]
  end

  def set_resource
    @resource = @parent.selling_items.find(params[:id])
  end

  def permitted_params
    params.require(:selling_item).permit(:description, :quantity, :measure, :price, :nds_percent)
  end
end
