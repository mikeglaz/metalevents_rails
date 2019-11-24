class CalendarController < ApplicationController
  helper_method :days_in_month, :current_month, :current_month_date, :calculate_days_view

  YEAR = 2019

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
    first_day_of_week = DateTime.current.change(day: 1).wday
    last_day_of_week = DateTime.current.end_of_month.wday

    start_date = DateTime.current.change(day: 1)
    end_date = DateTime.current.end_of_month

    if first_day_of_week > 0
      start_date -= first_day_of_week.days
    end

    if last_day_of_week < 6
      end_date += (6-last_day_of_week).days
    end
    # Oct 26
    prev_month_date = DateTime.current.change(day: 1) - first_day_of_week.days


    next_month_date = DateTime.current.next_month.change(day: 1) + (6-last_day_of_week)



    @days_array = []

    (start_date..end_date).each do |d|
      @days_array << d.day
    end

    @days_array


  end



  # def previous_month
  #   current_month
  # end

end
