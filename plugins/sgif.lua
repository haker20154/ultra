local run = function(msg,matches)
if matches[3] then

local texts = {}
for text in matches[3]:gmatch("[^\r\n]+") do
texts[#texts + 1] = URL.escape(text)
end
if #texts == 0 then
api.sendReply(msg,lang[ln].gif.error)
return
end
local sgif = download_to_file('http://magic-team.ir/wm.php?wtext='..URL.escape(matches[2])..'&texts='..json:encode(texts), 'sgif.gif')
senddocument(msg.chat.id, sgif,ok_cb,false)

else
local texts = {}
for text in matches[2]:gmatch("[^\r\n]+") do
texts[#texts + 1] = URL.escape(text)
end
if #texts == 0 then
api.sendReply(msg,lang[ln].gif.error)
return
end
local sgif = download_to_file('http://magic-team.ir/wm.php?texts='..json:encode(texts), 'sgif.gif')
sendocument(msg.chat.id, sgif,ok_cb,false)
end
end
return {
patterns = {
'^[/!](gif) (.+) %+ (.+)$',
'^[/!](gif) (.+)$'
},
run=run
}