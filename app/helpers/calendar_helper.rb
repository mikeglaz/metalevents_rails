module CalendarHelper
  def current_month
    @current_month ||= Date.current.month
  end
end
