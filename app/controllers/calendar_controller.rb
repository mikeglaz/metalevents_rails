class CalendarController < ApplicationController
  helper_method :days_in_month, :current_month, :current_month_date, :calculate_days_view

  YEAR = 2020

  def show

  end

  def days_in_month(month)
    DateTime.new(YEAR, month, 1).end_of_month.day
  end

  def current_month
    @current_month ||= Date.current.month
  end

  def current_month_date
    DateTime.current.change(day: 1)
  end

  def calculate_days_view
    # 6 (Friday)
    wday = DateTime.current.wday

    # Oct 26
    prev_month_date = DateTime.current.change(day: 1) - wday.days


    @days_array = []
    (prev_month_date..DateTime.current.end_of_month).each do |day|
      @days_array << day.day
    end

    @days_array


  end



  # def previous_month
  #   current_month
  # end

end
