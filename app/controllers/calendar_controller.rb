class CalendarController < ApplicationController
  helper_method :current_month, :next_month, :prev_month, :currently_selected_date, :get_events_for_date, :year
  attr_reader :currently_selected_date

  def show

    # if params[:year]
    #   @year = params[:year].to_i
    # else
    #   @year = DateTime.current.year
    # end

    # if params[:month]
    #   @currently_selected_date = DateTime.new(current_date.year, params[:month].to_i, 1)
    # else
    #   @currently_selected_date = DateTime.current
    # end

    @day_grid = calendar_day_grid

    @events = Event.where(date_and_time: @prev_month_start_date..@next_month_end_date )
  end

  def year
    @year
  end

  def current_month
    month, year = converted_date
    month
  end

  def converted_date
    # byebug
    if params[:date]
      params[:date].split('_').map(&:to_i)
    else
      [DateTime.current.month, DateTime.current.year]
    end
  end

  # def currently_selected_date
  #   params[:date]
  #   @currently_selected_date.month
  # end

  # def next_month
  #   if current_date.month == 12
  #     @year += 1
  #   end

  #   @currently_selected_date.next_month.month
  # end

  # def prev_month
  #   if current_date.month == 1
  #     @year -= 1
  #   end

  #   @currently_selected_date.prev_month.month
  # end

  # def select_month(month_num = @currently_selected_date.month)
  #   @currently_selected_date = DateTime.new(@year, month_num, 1)
  # end

  def get_events_for_date(date)
    @events.select do |event|
      event.date_and_time.to_date == date.to_date
    end
  end


  def calendar_day_grid
    selected_month, selected_year = converted_date
    working_date = DateTime.new(selected_year, selected_month, 1)

    weekday_start = working_date.beginning_of_month.wday
    weekday_end = working_date.end_of_month.wday

    # if(params[:month])
    #   select_month(params[:month].to_i)
    # else
    #   select_month(current_date.month)
    # end

    # # Sun(0) - Sat(6)
    # first_day_of_week = @currently_selected_date.wday
    # last_day_of_week = @currently_selected_date.end_of_month.wday

    # start_date = @currently_selected_date.beginning_of_month
    # end_date = @currently_selected_date.end_of_month


    # selected_month_array = (start_date..end_date).map{|date| date.day}.map{ |day| {day => true}}

    @prev_month_start_date = working_date - weekday_start.days
    # prev_month_end_date = start_date - 1.days

    # prev_month_array = (@prev_month_start_date..prev_month_end_date).map{|date| date.day}.map{ |day| {day => false}}

    # next_month_start_date = start_date.next_month
    @next_month_end_date = working_date.end_of_month + (6 - weekday_end).days

    # next_month_array = (next_month_start_date...@next_month_end_date).map{|date| date.day}.map{ |day| {day => false}}


    # prev_month_array.concat(selected_month_array.concat(next_month_array))

    @prev_month_start_date...@next_month_end_date
  end
end
