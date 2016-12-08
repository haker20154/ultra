local function run(msg,matches)
 local hash = 'editelock'..msg.to.id
local  user = "user#id263175540"
local channel = get_receiver(msg)
  if matches[1] == 'lock' then
    redis:set(hash,true)
    if msg.to.type == "chat" then
      chat_add_user(channel,user,ok_cb,false)
    elseif msg.to.type == "channel" then
      channel_invite(channel,user,ok_cb,false)
    end
    return "قفل ادیت فعال شد"
elseif matches[1] == 'unlock' then
    redis:set(hash,false)
    
   if msg.to.type == "chat" then
      chat_del_user(channel,user,ok_cb,false)
    elseif msg.to.type == "channel" then
      kick_user_any(channel,user)
    end
    return "قفل ادیت غیر فعال شد"
    end
  end


return {
  patterns = {
    '^[/#!](lock) edit$',
    '^[/#!](unlock) edit$',
  },
  run = run
}