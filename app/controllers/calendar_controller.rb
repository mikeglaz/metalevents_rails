class CalendarController < ApplicationController
  helper_method :days_in_month, :current_month, :previous_month

  YEAR = 2020

  def show

  end

  def days_in_month(month)
    Date.new(YEAR, month, 1).end_of_month.day
  end

  def current_month
    @current_month ||= Date.current.month
  end

  def current_month_date
    Date.current.beginning
  end

  # def previous_month
  #   current_month
  # end

end
