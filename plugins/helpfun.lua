do

function run(msg, matches)
  return [[
		دستورات تفریحی💥
#time اعلام ساعت تاریخ
#arz اعلام نرخ ارز،طلا،دلار
#earz تبدیل واحدهای پول
#earz 36000 :مثال
#calc ماشین حساب
برای ضرب کردن از * برای تقسیم کردن از / و برای به توان رساندن از ^ استفاده کنید.
#mobile لیست موبایل های جدید
#date مناسبت های ماه
#news جدیدترین خبرها
#music موزیک درخواستی جلو دستور اسم خواننده
#app برنامه درخواستی جلو دستور اسم برنامه
#write زیبا نویسی اسم جلو دستور اسم را بنویسید
🔻🔻🔻🔻🔻🔻🔻
#linksp لینک ساپورت ما
🔺🔺🔺🔺🔺🔺🔺
#feedback ارسال نظرات انتقادات
مثال:
#feedback رباتتون عالیه
  ]]

  end
return {
  description = "shows nerkh", 
  usage = "nerkh : return sudousers",
  patterns = {
    "^[!/]helpfun$",

  },
  run = run
}
end