local function history(extra, suc, result)
  for i=1, #result do
    fwd_msg(result[i].id, extra.chatid, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    send_msg(extra.chatid, '"'..#result..'" پیام اخیر گروه/سوپر گروه مورد نظر ', ok_cb, false)
  end
end
function run(msg, matches)
local hash = 'bot:fwd'
local num = redis:get(hash)
if matches[1]:lower() == 'msgid' and msg.reply_id and is_momod(msg) then
return msg.reply_id
end
if matches[1] == 'fwdfrom' and is_admin(msg) then
get_history(matches[2], matches[3] + 1 , history , {chatid = msg.to.peer_id, con = matches[3]})
end
if matches[1] == 'fwdall' and is_admin(msg) then
if is_sudo(msg) then
local response = matches[2]
if msg.reply_id then
response = msg.reply_id
end
local data = load_data(_config.moderation.data)
local groups = 'groups'
for k,v in pairs(data[tostring(groups)]) do
chat_id =  v
local chat = 'chat#id'..chat_id
local channel = 'channel#id'..chat_id
fwd_msg(chat, response, ok_cb, false)
fwd_msg(channel, response, ok_cb, false)
end
end
end
if matches[1]:lower() == 'fwd' and is_momod(msg) then
if msg.reply_id then
num = msg.reply_id
else
num = matches[2]
end
      fwd_msg(get_receiver(msg), num, ok_cb, false)
end
if matches[1]:lower() == 'setfwd' and is_sudo(msg) then
if msg.reply_id then
num = msg.reply_id
else
num = matches[2]
end
redis:set(hash, num)
return 'پیام فوروارد تنظیم شد'
end 
if matches[1]:lower() == 'version' then
fwd_msg(get_receiver(msg), num, ok_cb, false)
end
end
return {
  patterns = {
"^[!/#]([Mm]sgid)$",
"^[!/#]([Ff]wd) (.*)$",
"^[!/#]([Ff]wd)$",
"^[!/#]([Ff]wdall) (.*)$",
"^[!/#]([Ff]wdall)$",
"^[!/#]([Ss]etfwd) (.*)$",
"^[!/#]([Ss]etfwd)$",
"^[!/#]([Ff]wdfrom) (%d+) (%d+)$",
"^[!/#]([Vv]ersion)$",
  },
  run = run
  }