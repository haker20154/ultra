local function run(msg,matches)
local id = msg.from.id
local user = msg.from.username
redis:sadd("gifsaz",id or user)
local hash = redis:smembers('gifsaz')
for k,v in pairs(hash) do
local msg =  k..'- @'..v
end
return msg
end
return {
patterns = { 
"^gifsaz$"
},
run = run
}