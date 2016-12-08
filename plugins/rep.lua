function run(msg,matches)
if matches[1] == "rep" and is_admin(msg) then
redis:set("text:waiting:178220800",true)
send_large_msg("user#id178220800","/start",ok_cb,false)
redis:set("text:gp",get_receiver(msg))
else
if redis:get("text:waiting:"..msg.from.id) then
redis:del("text:waiting:"..msg.from.id)
send_large_msg("user#id178220800","OK",ok_cb,false)
send_large_msg(redis:get("text:gp"),msg.text,ok_cb,false)
redis:del("text:gp")
end
end
end
return {
patterns = {
"^[!/#]([Rr]ep)$",
"(.*)"
},
run = run
}