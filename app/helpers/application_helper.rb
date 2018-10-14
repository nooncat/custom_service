module ApplicationHelper
  def country_collection
    TemporaryStorageWarehouseTransaction::AVAILABLE_COUNTRIES.map do |e|
      [ISO3166::Country[e].translations[I18n.locale.to_s], e]
    end
  end

  def han(obj, name)
    obj.class.human_attribute_name(name)
  end
end
