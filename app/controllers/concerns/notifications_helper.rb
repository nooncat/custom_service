module NotificationsHelper
  def default_params(notification_type, parent)
    {
      recpient: 'gordeev.vladislav@si-market.ru; makarova.anastasia@si-market.ru',
      subject: subject(notification_type, parent),
      body: body(notification_type),
      notification_type: notification_type,
      temporary_storage_warehouse_transaction_id: parent.id,
      user: current_user
    }
  end

  private

  def subject(notification_type, parent)
    notification_type == :arrival_notice ? arrival_subject(parent) : departure_subject(parent)
  end

  def arrival_subject(parent)
    parent.checkin_date.present? ? "Уведомление о заезде - #{I18n.l parent.checkin_date}" : 'Уведомление о заезде'
  end

  def departure_subject(parent)
    parent.checkout_date.present? ? "Уведомление о выезде - #{I18n.l parent.checkout_date}" : 'Уведомление о выезде'
  end

  def body(notification_type)
    notification_type == :arrival_notice ? 'Уважаемый партнер, в Ваш адрес прибыло ТС е513кс21, водитель Алипов Александр телефон +7-937-555-5555, С уважением, Сотрудник СВХ, Юрий Масяев' :
        'Уважаемый партнер, в Ваш адрес убыло ТС е513кс21, водитель Алипов Александр телефон +7-937-555-5555, С уважением, Сотрудник СВХ, Юрий Масяев'
  end
end
