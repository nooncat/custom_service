class Cabinet::TemporaryStorageWarehouseTransactions::NotificationsController < Cabinet::ApplicationController
  before_action :set_parent
  before_action :set_notification_type
  before_action :set_resource, only: [:show]

  def show
  end

  def new
    @resource = Notification.new(
      default_params.merge(
        notification_type: @notification_type,
        temporary_storage_warehouse_transaction_id: @parent.id,
        user: current_user
      )
    )
  end

  def create
    @resource = Notification.new(permitted_params)

    if @resource.save
      redirect_to [:edit, :cabinet, @parent], notice: 'Уведомление создано.'
    else
      render :new
    end
  end

  private

  def set_parent
    @parent = TemporaryStorageWarehouseTransaction.find params[:temporary_storage_warehouse_transaction_id]
  end

  def set_notification_type
    type = params[:notification_type]

    @notification_type = :arrival_notice if type == 'arrival_notice'
    @notification_type = :departure_notice if type == 'departure_notice'
    @notification_type ||= :arrival_notice
  end

  def set_resource
    @resource = Notification.find(params[:id])
  end

  def default_params
    {
      recpient: 'gordeev.vladislav@si-market.ru; makarova.anastasia@si-market.ru',
      subject: @notification_type == :arrival_notice ? 'Уведомление о заезде' : 'Уведомление о выезде',
      body: 'Уважаемый партнер, в Ваш адрес прибыло ТС е513кс21, водитель Алипов Александр телефон +7-937-555-5555, С уважением, Сотрудник СВХ, Юрий Масяев'
    }
  end

  def permitted_params
    params.require(:notification).permit(
      :notification_type, :user_id, :temporary_storage_warehouse_transaction_id,
      :recpient, :subject, :body
    ).merge(
      temporary_storage_warehouse_transaction_id: @parent.id,
      user: current_user
    )
  end
end
