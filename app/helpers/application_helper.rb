module ApplicationHelper
  def date_decorate(date)
    date&.strftime('%d.%m')
  end

  def get(record)
    record.expired? ? record.rate : record.forced_rate
  end
end
