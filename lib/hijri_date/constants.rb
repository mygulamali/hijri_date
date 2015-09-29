module HijriDate
  # number of days in the year per month
  DAYS_IN_YEAR = [30, 59, 89, 118, 148, 177, 207, 236, 266, 295, 325, 355]

  # number of days in 30-years per year
  DAYS_IN_30_YEARS = [
    354, 708, 1063, 1417, 1771, 2126, 2480, 2834, 3189, 3543,
    3898, 4252, 4606, 4961, 5315, 5669, 6024, 6378, 6732, 7087,
    7441, 7796, 8150, 8504, 8859, 9213, 9567, 9922, 10276, 10631
  ]

  KABISA_YEAR_REMAINDERS = [2, 5, 8, 10, 13, 16, 19, 21, 24, 27, 29]
end
