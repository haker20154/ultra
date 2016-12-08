local function run(msg,matches)
local hour = 3600
if is_momod(msg) then
if matches[1]:lower() == "muteall" then
local num = tonumber(matches[2]) * hour
redis:setex("muteall:"..msg.to.id,num,true)
return "گروه برای "..matches[2].." ساعت موت آل شد"
elseif matches[1]:lower() == "unmuteall" then
redis:del("muteall:"..msg.to.id)
return "گروه آن میوت شد"
end
end
end
return {
patterns = {
"^[!/#]([Mm]uteall) (.*)$",
"^[!/#]([Uu]nmuteall)$"
},
run = run,
}