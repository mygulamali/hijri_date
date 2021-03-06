# encoding: utf-8

module HijriDate
  MONTH_NAMES = {
    ar: [
      nil,
      'محرم الحرام',
      'صفر المظفر',
      'ربيع الاول',
      'ربيع الآخر',
      'جمادى الاولى',
      'جمادى الاُخرى',
      'رجب الاصب',
      'شعبان الكريم',
      'رمضان المعظم',
      'شوال المكرم',
      'ذي القعدة الحرام',
      'ذي الحجة الحرام'
    ],
    en: [
      nil,
      'Moharram al-Haraam',
      'Safar al-Muzaffar',
      'Rabi al-Awwal',
      'Rabi al-Aakhar',
      'Jumada al-Ula',
      'Jumada al-Ukhra',
      'Rajab al-Asab',
      'Shabaan al-Karim',
      'Ramadaan al-Moazzam',
      'Shawwal al-Mukarram',
      'Zilqadah al-Haraam',
      'Zilhaj al-Haraam'
    ]
  }

  MONTHNAMES_AR = MONTH_NAMES[:ar]
  MONTHNAMES_EN = MONTH_NAMES[:en]

  SHORT_MONTH_NAMES = {
    en: [
      nil,
      'Moharram',
      'Safar',
      'Rabi I',
      'Rabi II',
      'Jumada I',
      'Jumada II',
      'Rajab',
      'Shabaan',
      'Ramadaan',
      'Shawwal',
      'Zilqadah',
      'Zilhaj'
    ]
  }

  SHORT_MONTHNAMES_EN = SHORT_MONTH_NAMES[:en]
end
