local function run(msg,matches)
  local welcome = "wel"..msg.to.id
  local bye = "xread"..msg.to.id
  local wlc = "welcome"..msg.to.id
  local full = "bye"..msg.to.id
  if matches[1] == "set wlc" and is_momod(msg) then
    redis:set(wlc, matches[2])
    local reply = "با موفقیت ذخیره شد🚀"
    return reply_msg(msg.id, reply, ok_cb, false)
  end
  if matches[1] == "set bye" and is_momod(msg) then
    redis:set(full , matches[2])
    local reply = "با موفقیت ذخیره شد🚀"
    return reply_msg(msg.id, reply, ok_cb, false)
  end
  if matches[1] == "del wlc" and is_momod(msg) then
    redis:del(wlc)
    local reply = "با موفقیت پاک شد🚀"
    return reply_msg(msg.id, reply, ok_cb, false)
  end
  if matches[1] == "del bye" and is_momod(msg) then
    redis:del(full)
    local reply = "با موفقیت پاک شد🚀"
    return reply_msg(msg.id, reply, ok_cb, false)
  end
  if matches[1] == "del service" and is_momod(msg) then
    redis:del(full)
    redis:del(wlc)
    local reply = "با موفقیت پاک شد🚀"
    return reply_msg(msg.id, reply, ok_cb, false)
  end
  if matches[1] == "on service" and is_momod(msg) then
    redis:set(welcome , true)
    redis:set(bye , true)
    local ali = "با موفقیت روشن شد🚀"
    return reply_msg(msg.id, ali, ok_cb, false)
  end
  if matches[1] == "off service" and is_momod(msg) then
    redis:set(welcome, false)
    redis:set(bye, false)
    local ali = "با موفقیت خاموش شد🚀"
    return reply_msg(msg.id, ali, ok_cb, false)
  end
  if matches[1] == "on wlc" and is_momod(msg) then
    redis:set(welcome, true)
    local ali = "با موفقیت روشن شد🚀"
    return reply_msg(msg.id, ali, ok_cb, false)
  end
  if matches[1] == "off wlc" and is_momod(msg) then
    redis:set(welcome, false)
    local ali = "با موفقیت خاموش شد🚀"
    return reply_msg(msg.id, ali, ok_cb, false)
  end
  if matches[1] == "on bye" and is_momod(msg) then
    redis:get(bye, true)
    local ali = "با موفقیت روشن شد🚀"
    return reply_msg(msg.id, ali, ok_cb, false)
  end
  if matches[1] == "off bye" and is_momod(msg) then
    redis:set(bye, false)
    local ali = "با موفقیت خاموش شد🚀"
    return reply_msg(msg.id, ali, ok_cb, false)
  end
  if matches[1] == "on service" or matches[1] == "off service" or matches[1] == "off wlc" or matches[1] == "on wlc" or matches[1] == "off bye" or matches[1] == "on bye" and not is_momod(msg) then
    local sorry = "🙁Sorry "..msg.from.first_name.."\n Only Mods Can Use This Commands ☹️"
    return reply_msg(msg.id, sorry, ok_cb, false)
  end
  if redis:get(welcome) and matches[1] == "chat_add_user" or matches[1] == "chat_add_user_link" then
    local reply = redis:get(wlc) or "😃 Hi "..msg.action.user.first_name.."\n Welcome To "..msg.to.title.."\n 🆔 Your ID :("..msg.action.user.id..")\n"
    return reply_msg(msg.id, reply, ok_cb, false)
  end
  if redis:get(bye) and matches[1] == "chat_del_user" then
    local reply = redis:get(full) or "🚏Bye "..msg.action.user.first_name.."\n"
    return reply_msg(msg.id, reply, ok_cb, false)
  end
end

return { 
 patterns = {
     "^[!/#](set wlc) (.+)$",
     "^[!/#](set bye) (.+)$",
     "^[!/#](del wlc)$",
     "^[!/#](del bye)$",
     "^[!/#](del service)$",
     "^[!/#](on service)$",
     "^[!/#](off service)$",
     "^[!/#](on wlc)$",
     "^[!/#](on bye)$",
     "^[!/#](off wlc)$",
     "^[!/#](off bye)$",
     "^!!tgservice (chat_add_user)$",
     "^!!tgservice (chat_add_user_link)$",
     "^!!tgservice (chat_del_user)$",
 }, 
 run = run, 
}