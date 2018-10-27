class Cabinet::SellingsController < Cabinet::ApplicationController
  def index
    @q = Selling.ransack params[:q]
    @collection = @q.result.page(params[:page])
  end

  def show
    @resource = Selling.find params[:id]
    @parent = @resource.temporary_storage_warehouse_transaction
    @selling_items = @resource.selling_items
  end
end
