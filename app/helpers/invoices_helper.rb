module InvoicesHelper
  def buyer_requisites(selling)
    company = selling.temporary_storage_warehouse_transaction.company
    "#{company.name}, ИНН #{company.inn}, КПП #{company.kpp}, #{company.uridicheskiy_address}, тел.: #{company.phone}"
  end

  def item_total_price(item)
    item.price * item.quantity
  end

  def item_total_price_with_discount(item)
    item_total_price(item)
  end

  def format_price(price)
    number_to_currency(price, separator: ',', delimiter: ' ', format: '%n')
  end

  def vehicle(selling)
    transaction = selling.temporary_storage_warehouse_transaction
    "#{transaction.vehicle_number}/#{transaction.vehicle_type} #{}"
  end
end
