local function run(msg,matches)
local text = "Zing Zoong"
return reply_msg(msg.id,text,ok_cb,false)
end
return {
  patterns = {
   "^[/#!]zang$"
  },
  run = run
}