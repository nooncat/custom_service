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

  def update
    @resource = Selling.find params[:id]

    if @resource.update(permitted_params)
      redirect_to action: :show
    end
  end

  def permitted_params
    params.require(:selling).permit(:payed_at, :reporting_documents_provided_at)
  end
end
