class CalendarController < ApplicationController
  helper_method :days_in_month, :current_month, :calculate_days_view, :select_month, :next_month, :prev_month, :currently_selected_date
  attr_reader :currently_selected_date

  YEAR = 2019

  def show
    if params[:month]
      @currently_selected_date = DateTime.new(YEAR, params[:month].to_i, 1)
    else
      @currently_selected_date = DateTime.current
    end
  end

  def days_in_month(month)
    DateTime.new(YEAR, month, 1).end_of_month.day
  end

  def current_month
    @currently_selected_date.month
  end

  def next_month
    @currently_selected_date.next_month.month
  end

  def prev_month
    @currently_selected_date.prev_month.month
  end

  def select_month(month_num)
    @selected_month_date = DateTime.new(YEAR, month_num, 1)
  end

  # def currently_selected_date=(date)
  #   @currently_selected_date = date
  # end

  # def currently_selected_date
  #   @currently_selected_date
  # end

  def calculate_days_view
    if(params[:month])
      select_month(params[:month].to_i)
    else
      select_month(current_month)
    end
    # 6 (Friday)
    first_day_of_week = @selected_month_date.wday
    last_day_of_week = @selected_month_date.end_of_month.wday

    start_date = @selected_month_date.change(day: 1)
    end_date = @selected_month_date.end_of_month


    byebug

    selected_month_hash = (start_date..end_date).map{|date| date.day}.map{ |day| {day => true}}.to_h


    prev_month_start_date = start_date - first_day_of_week.days
    prev_month_end_date = start_date - 1.days

    prev_month_hash = (prev_month_start_date..prev_month_end_date).map{|date| date.day}.map{ |day| {day => false}}.to_h

    next_month_start_date = start_date + 1.days
    next_month_end_date = start_date + (6 - last_day_of_week).days

    next_month_hash = (next_month_start_date..next_month_end_date).map{|date| date.day}.map{ |day| {day => false}}.tp_h




    calendar_hash = prev_month_hash.merge(selected_month_hash.merge(next_month_hash))



    # if first_day_of_week > 0
    #   start_date -= first_day_of_week.days
    # end

    # if last_day_of_week < 6
    #   end_date += (6-last_day_of_week).days
    # end
    # Oct 26
    # prev_month_date = @selected_month_date.change(day: 1) - first_day_of_week.days


    # next_month_date = @selected_month_date.next_month.change(day: 1) + (6-last_day_of_week)



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
