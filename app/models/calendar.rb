class Calendar < ApplicationRecord

  def self.generate_months
    months = []
    date = DateTime.current

    12.times do |i|
      months << [date.strftime("%b %Y"), date.strftime("%m/%y")]
      date = date.next_month
    end

    months
  end

  def self.generate_days_grid
    day = Struct.new(:month, :year, :num_days, :first_day_of_week)

    date = DateTime.current

    days = []

    12.times do |i|
      days << day.new(date.month, date.year, date.end_of_month.day, date.beginning_of_month.wday)
      date = date.next_month
    end

    days
  end
end
