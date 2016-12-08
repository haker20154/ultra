local namefa = "کرول"
local nameen = "[Cc][Rr][Uu][Ee][Ll]"
local function get_response(text)
if text:match(nameen) then
  text = text:gsub(nameen.." ","")
end
if text:match(namefa) then
  text = text:gsub(namefa.." ","")
end
local lang = redis:get('simsimi:lang')
local myurl = 'http://api.simsimi.com/request.p?key=52a2e801-b547-4882-b173-6683989209d8&lc='..lang..'&ft=1.0&text='..URL.escape(text)
local jdat = json:decode(http.request(myurl))
return jdat.response
end
local function action_by_reply(extra, success, result)
if success then
  local bot = our_id
  if result.from.peer_id == tonumber(bot) then
    local msg2 = extra.msg
  local matn = msg2.text
    reply_msg(msg2.id, get_response(matn), ok_cb, true)
  end
  end
end
function run(msg, matches)
if not is_vip_group(msg)
return 
end
if not redis:get("chat:"..msg.to.id) then
return
end
if matches[1] == "start chat" and is_momod(msg) then
redis:set("chat:"..msg.to.id,"start")
return "سلام 😊\nبرای چت کردن با من رو پیامم ریپلی کن و حرف بزن حرف زشت نزن که من دهن لقم"
end
if matches[1] == "stop chat" then
return "چت با ربات هوشمند خاموش شد" 
redis:del("chat:"..msg.to.id)
end
local text = msg.text
 if text:match("[!/#][Ss]etlang (.*)") and is_sudo(msg) then
  local lang = text:match("[!/#][Ss]etlang (.*)")
    redis:set('simsimi:lang',lang)
    return 'Lang Set To '..lang
  esleif text:match("[!/#](.*) chat") and is_momod(msg) then
    local value = {text:match("[!/#](.*) chat")}
    if value[1] == "start" then
      redis:set("chat:"..msg.to.id,"start")
      return "سلام 😊\nبرای چت کردن با من رو پیامم ریپلی کن و حرف بزن حرف زشت نزن که من دهن لقم"
    elseif value[1] == "stop" then
      redis:del("chat:"..msg.to.id)
      return "چت با ربات هوشمند خاموش شد" 
    end
  elseif text:match(nameen.." (.*)") and redis:get("chat:"..msg.to.id) then
  reply_msg(msg.id, get_response(text), ok_cb, true)
  elseif text:match(namefa.." (.*)") and redis:get("chat:"..msg.to.id) then
  reply_msg(msg.id, get_response(text), ok_cb, true)
  elseif msg.reply_id and redis:get("chat:"..msg.to.id) then
    get_message(msg.reply_id, action_by_reply, {msg=msg})
  end
  end
return {
   patterns = {
"(.*)",
},
   run = run
}