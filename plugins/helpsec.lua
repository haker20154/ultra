do

function run(msg, matches)
  return [[
🔐دستورات امنیتی🔐
✷✷✷✷✷✷✷✷✷✷✷✷✷
#lock link قفل کردن تبلیغات
#unlock link باز کردن تبلیغات
#lock strict تنظیمات سختگیرانه
💥لینک بزارن ربات هم لینک رو پاک میکنه هم خود شخص💥
#unlock strict جارج شدن از تنظیمات سختگیرانه
#lock spam قفل اسپم
#unlock spam باز کردن اسپم
#lock flood قفل کردن فلود
#unlock flood باز کرد فلود
#setflood حساسیت فلودکردن از یک تا بیست جلو دستور عدد بزنید
#mute photo قفل ارسال عکس
#unmute photo باز کردن ارسال عکس
#mute gifs قفل ارسال گیف
#unmute gifs باز کردن ارسال گیف
#mute video قفل ارسال ویدئو
#unmute video بازکردن ارسال ویدئو
#mute text قفل ارسال متن
#unmute text باز کردن ارسال متن
#lock sticker قفل ارسال استیکر
#unlock sticker باز کردن ارسال استیکر
#mute documents قفل ارسال فایل
#unmute documents باز کردن ارسال فایل
#lock tgservice قفل کردن پیامهای ورود و خروج افراد
#unlock tgservice بازکردن پیامهای ورود و خروج افراد
#muteslist مشاهده لیست میوت ها
#settings تنظیمات
#muteuser خفه کردن شخص با ریپلی برای آزاد کردن دوباره بزنید
#mutelist لیست خفه شدگان
#addword فیلتر کردن کمه جلوش کلمرو بنویس
#rw حذف کلمه از لیست فیلتر کلمرو جلوش بنویس
#clearbadwords حذف همه کلمات فیلتر شده
#bots لیست ربات های موجود
#public yes عمومی کردن گروه
#pudic no خصوصی کردن گروه
  ]]

  end
return {
  description = "shows nerkh", 
  usage = "nerkh : return sudousers",
  patterns = {
    "^[!/]helpsec$",

  },
  run = run
}
end