function run(msg, matches)
  if matches[1]:lower() == 'hex' and is_vip_group(msg) then
  local url = http.request("http://api.iteam-co.ir/colors.html")
  local jdat = json:decode(url)
  local text = matches[2]:lower()
  local textt = "Results : \n------------\n"
  for i = 1, #jdat do
    local hex = jdat[i].hex:lower()
  local name = jdat[i].name:lower()
  if hex:match(text) or name:match(text) then
    textt = textt.."Name : "..jdat[i].name.."\nHEX : "..jdat[i].hex.."\nRGB : "..jdat[i].rgb.."\n------------\n"
  end
  end
if textt == "Results : \n------------\n" then
  return "Noting Found"
else
  return textt
end
elseif matches[1]:lower() == "color" and is_vip_group(msg) then
local color = matches[2]:gsub("#","")
local link = http.request("http://api.img4me.com/?text=testetestetest&font=arial&size=10&bcolor="..color.."&fcolor="..color.."&type=png")
if link:match("HEX") then
return "Invalid HEX Code"
end
local file = download_to_file(link,"sample.webp")
send_document(get_receiver(msg),file,ok_cb,false)
end
end
return {
patterns = {
  "^[!/#]([Hh][Ee][Xx]) (.*)$",
  "^[!/#]([Cc][Oo][Ll][Oo][Rr]) (.*)$"
  }, 
  run = run 
}