require 'hijri_date/constants'
require 'hijri_date/month_names'
require 'hijri_date/version'

module HijriDate
  class Date
    # create setters and getters
    attr_accessor :year, :month, :day

    # constructor
    def initialize(year = 1432, month = 4, day = 20)
      @year = year
      @month = month
      @day = day
    end

    # convert to string object
    def to_s(date = self)
      "#{date.day} #{MONTH_NAMES[:en][date.month]} #{date.year}H"
    end

    # is this (or the specified) year a Kabisa year?
    def kabisa?(year = self.year)
      KABISA_YEAR_REMAINDERS.any? { |remainder| year % 30 == remainder }
    end

    # number of days in this (or the specified) month and year
    def days_in_month(month = self.month, year = self.year)
      (month == 12 && kabisa?(year) || month.odd?) ? 30 : 29
    end

    # day of the year corresponding to this (or specified) Hijri date
    def day_of_year(date = self)
      date.month == 1 ? date.day : (DAYS_IN_YEAR[date.month - 2] + date.day)
    end

    # return Julian Day number associated with this (or specified) Hijri date
    def jd(date = self)
      y30 = (date.year / 30.0).floor
      day_number = 1948084 + y30 * 10631 + day_of_year(date)

      if date.year % 30 == 0
        day_number
      else
        day_number + DAYS_IN_30_YEARS[date.year - y30 * 30 - 1]
      end
    end

    # comparison operator
    def ==(other)
      if other.is_a?(Date)
        return other.year == year && other.month == month && other.day == day
      end
      fail TypeError, 'expected HijriDate::Date'
    end

    # return a new HijriDate object that is n days after the current one.
    def +(n)
      case n
      when Numeric
        return HijriDate.jd(jd + n)
      end
      fail TypeError, 'expected numeric'
    end

    # return a new HijriDate object that is n days before the current one.
    def -(n)
      case n
      when Numeric
        return HijriDate.jd(jd - n)
      end
      fail TypeError, 'expected numeric'
    end

    # return the day of the week (0-6, Sunday is zero)
    def wday
      Object::Date.jd(jd).wday
    end
  end

  # return new Hijri Date object associated with specified Julian Day number
  def self.jd(jd = 1948084)
    left = (jd - 1948084).to_i
    y30 = (left / 10631.0).floor
    left -= y30 * 10631

    i = 0
    i += 1 while left > DAYS_IN_30_YEARS[i]

    year = (y30 * 30 + i).to_i
    left -= DAYS_IN_30_YEARS[i - 1] if i > 0

    i = 0
    i += 1 while left > DAYS_IN_YEAR[i]

    month = (i + 1).to_i
    day = i > 0 ? (left - DAYS_IN_YEAR[i - 1]) : left

    Date.new(year, month, day)
  end
end
