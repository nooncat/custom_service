module SearchHelper
  def result_title(result)
    type = result.searchable_type

    case type
    when 'Company' then result.searchable.name
    when 'Selling' then result.searchable.company_name
    end
  end

  def result_link(result)
    type = result.searchable_type
    send("cabinet_#{type.downcase}_path", result.searchable)
  end
end
