function run(msg, matches)
  local sudo1 = URL.escape(matches[1])
local sudo2 = URL.escape(matches[2])
  local url = "http://api.iteam-co.ir/imgmaker.php?text="..sudo1.."&size="..sudo2..""
   local file = download_to_file(url,'iteam.jpg')
   send_photo2(get_receiver(msg), file, "@ch_news", rmtmp_cb, cb_extra)

        
end


return {
  description = "تبدیل متن به لوگو",
  usage = {
    "ساخت لوگو",
  },
  patterns = {
   "^[!/#]logo (.*) (.*)$"
  },
  run = run
}

