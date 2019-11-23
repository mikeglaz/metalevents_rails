class CalendarController < ApplicationController
  helper_method :days_in_month

  YEAR = 2020

  def show

  end

  def days_in_month(month)
    Date.new(YEAR, month, 1).end_of_month.day
  end

end
