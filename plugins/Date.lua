local function run(msg, matches)
  local url = http.request('http://magic-team.ir/events.php')
  local jdat = json:decode(url)
  local text = ''
  for i = 1 , #jdat do
    text = text..'📆روز  '..jdat[i].shdate..'\n💢مناسبت : '..(jdat[i].event or'')..'\n➖➖➖➖\n\n'
end
  return text
  send_document(get_receiver(msg), "./data_day/data1.png", ok_cb, false) 
  end
 
 
 
 
return {
  usage = "/date : نمایش",
  patterns = {
    "^[/#!][Dd][Aa][Tt][Ee]$",
    "^[Dd][Aa][Tt][Ee]$",	
  },
  run = run
}