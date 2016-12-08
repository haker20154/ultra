local function run(msg,matches)
if matches[1] == "add" and is_admin1(msg) then
local textadd = "🆕 group add\nAdmin : "..msg.from.id.." @"..(msg.from.username or '').."\nGp id : "..msg.to.id


send_large_msg("user#id284244758",textadd)
send_large_msg("user#id146885624",textadd)

end
if matches[1] == "rem" and is_admin1(msg) then

local textrem = "🆕 group removed\nAdmin : "..(msg.from.id or '').." @"..(msg.from.username or '').."\nGp id : "..(msg.to.id or '')
send_large_msg("user#id284244758",textrem)
send_large_msg("user#id146885624",textrem)
end
end
return {
patterns = {
"^[!#/]([Aa]dd)$",
"^[!#/]([Rr]em)$"
},
run = run
}