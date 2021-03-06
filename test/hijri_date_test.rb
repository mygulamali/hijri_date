require 'date'
require 'hijri_date'
require 'minitest/autorun'
require 'minitest/pride'

class HijriDateTest < MiniTest::Test
  def setup
    @date = HijriDate::Date.new # 20/04/1432H = 25/03/2011AD
  end

  def test_kabisa_year
    refute @date.kabisa?
    assert @date.kabisa? 1431
  end

  def test_days_in_month
    assert_equal 29, @date.days_in_month
    assert_equal 29, @date.days_in_month(12)
    assert_equal 30, @date.days_in_month(12, 1431)
  end

  def test_day_of_year
    assert_equal 109, @date.day_of_year
    assert_equal 10, HijriDate::Date.new(1432, 1, 10).day_of_year
    assert_equal 355, HijriDate::Date.new(1431, 12, 30).day_of_year
    assert_equal 354, HijriDate::Date.new(1432, 12, 29).day_of_year
  end

  def test_conversion_to_jd
    assert_equal 2455646, @date.jd
  end

  def test_comparison
    assert @date == HijriDate::Date.new(@date.year, @date.month, @date.day)
    refute @date == HijriDate::Date.new(@date.year + 1, @date.month, @date.day)
    refute @date == HijriDate::Date.new(@date.year, @date.month + 1, @date.day)
    refute @date == HijriDate::Date.new(@date.year, @date.month, @date.day + 1)

    assert_raises TypeError do
      @date == Date.today
    end
  end

  def test_add
    assert_equal 21, (@date + 1).day

    date = HijriDate::Date.new(1432, 12, 29) + 1
    assert_equal HijriDate::Date.new(1433, 1, 1), date
  end

  def test_subtract
    assert_equal 19, (@date - 1).day

    date = HijriDate::Date.new(1433, 1, 1) - 1
    assert_equal HijriDate::Date.new(1432, 12, 29), date
  end

  def test_conversion_from_jd
    assert_equal @date, HijriDate.jd(2455646)
  end

  def test_hijri_gregorian_conversion
    date = Date.jd(@date.jd)
    assert_equal 2011, date.year
    assert_equal 3, date.month
    assert_equal 25, date.day

    date = HijriDate.jd(Date.new(2011, 3, 25).jd)
    assert_equal 1432, date.year
    assert_equal 4, date.month
    assert_equal 20, date.day
  end

  def test_day_of_week
    assert_equal 5, @date.wday # Friday
  end
end
