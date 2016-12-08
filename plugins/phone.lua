function run(msg, matches)
  if matches[1]:lower() == 'phone' then
  local url = http.request("http://api.iteam-co.ir/country-codes.html")
  local jdat = json:decode(url)
  local text = matches[2]:lower()
  local textt = "Results : \n------------\n"
  for i = 1, #jdat do
    local dial = jdat[i].dial_code:lower()
    local name = jdat[i].name:lower()
  local code = jdat[i].code:lower()
    if dial:match(text) or name:match(text) or code:match(text) then
      textt = textt.."Country Name : "..jdat[i].name.."\nDial Code : "..jdat[i].dial_code.."\nName Code : "..jdat[i].code.."\n------------\n"
    end
  end
if textt == "Results : \n------------\n" then
  return "Noting Found"
else
  return textt
end
end
end
return {
patterns = {
  "^[!/#]([Pp][Hh][Oo][Nn][Ee]) (.*)$",
  }, 
  run = run 
}