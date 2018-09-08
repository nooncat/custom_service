class Cabinet::TemporaryStorageWarehouseTransactionsController < Cabinet::ApplicationController
  def index
    @collection = TemporaryStorageWarehouseTransaction.all
  end

  def new
    @resource = TemporaryStorageWarehouseTransaction.new
  end

  def edit
    @resource = TemporaryStorageWarehouseTransaction.find(params[:id])
  end
end
