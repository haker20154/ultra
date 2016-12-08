axstat[3] = maxstat[2]
 maxid[3] = maxid[2]
maxname[2] = user.print_name
 maxuser[2] = user.username
 maxid[2] = user.peer_id
 maxstat[2] = tonumber(redis:get(shash)) + tonumber(redis:get(phash)) + tonumber(redis:get(thash)) + tonumber(redis:get(ohash))
 elseif tonumber(redis:get(shash)) + tonumber(redis:get(phash)) + tonumber(redis:get(thash)) + tonumber(redis:get(ohash)) > maxstat[3] then
 maxname[3] = user.print_name
 maxuser[3] = user.username
 maxid[3] = user.peer_id
 maxstat[3] = tonumber(redis:get(shash)) + tonumber(redis:get(phash)) + tonumber(redis:get(thash)) + tonumber(redis:get(ohash))
 end
 end
 maxst[1] = redis:get('utmsgst:'..maxid[1]..':'..cb_extra)
 maxph[1] = redis:get('utmsgph:'..maxid[1]..':'..cb_extra)
 maxtex[1] = redis:get('utmsgtex:'..maxid[1]..':'..cb_extra)
 maxoth[1] = redis:get('utmsgoth:'..maxid[1]..':'..cb_extra)
 if maxid[2] then
 maxst[2] = redis:get('utmsgst:'..maxid[2]..':'..cb_extra)
 maxph[2] = redis:get('utmsgph:'..maxid[2]..':'..cb_extra)
 maxtex[2] = redis:get('utmsgtex:'..maxid[2]..':'..cb_extra)
 maxoth[2] = redis:get('utmsgoth:'..maxid[2]..':'..cb_extra)
 end
 if maxid[3] then
 maxst[3] = redis:get('utmsgst:'..maxid[3]..':'..cb_extra)
 maxph[3] = redis:get('utmsgph:'..maxid[3]..':'..cb_extra)
 maxtex[3] = redis:get('utmsgtex:'..maxid[3]..':'..cb_extra)
 maxoth[3] = redis:get('utmsgoth:'..maxid[3]..':'..cb_extra)
 end
 if not maxuser[1] or maxuser[1] == '' then
 maxuser[1] = 'ندارد'
 else
 maxuser[1] = '@'..maxuser[1]
 end
 if not maxuser[2] or maxuser[2] == '' then
 maxuser[2] = 'ندارد'
 else
 maxuser[2] = '@'..maxuser[2]
 end
 if not maxuser[3] or maxuser[3] == '' then
 maxuser[3] = 'ندارد'
 else
 maxuser[3] = '@'..maxuser[3]
end
local text = '♨️فعالان امروز گروه\n1⃣ '..maxname[1]..'〖'..maxuser[1]..'〗\n\n📨تعداد پیام های ارسالی: '..maxtex[1] + maxph[1] + maxst[1] + maxoth[1]..'\n\n👾استیکر: '..maxst[1]..'\n\n📷تصویر: '..maxph[1]..'\n\n📃 متن: '..maxtex[1]..'\n\n📦 سایر: '..maxoth[1]
if maxid[2] then
 if not maxid[3] then
text = text..'\n\n 2⃣ '..maxname[2]..' 〖'..maxuser[2]..'〗\n\n📨تعداد پیام های ارسالی: '..maxtex[2] + maxph[2] + maxst[2] + maxoth[2]..'\n\n👾استیکر: '..maxst[2]..'\n\n📷تصویر: '..maxph[2]..'\n\n📃 متن: '..maxtex[2]..'\n\n📦 سایر: '..maxoth[2]
else
text = text..'\n\n 2⃣ '..maxname[2]..' 〖'..maxuser[2]..'〗\n\n📨تعداد پیام های ارسالی: '..maxtex[2] + maxph[2] + maxst[2] + maxoth[2]..'\n\n👾استیکر: '..maxst[2]..'\n\n📷تصویر: '..maxph[2]..'\n\n📃 متن: '..maxtex[2]..'\n\n📦 سایر: '..maxoth[2]..'\n\n 3⃣ '..maxname[3]..' 〖'..maxuser[3]..'〗\n\n📨تعداد پیام های ارسالی: '..maxtex[3] + maxph[3] + maxst[3] + maxoth[3]..'\n\n👾استیکر: '..maxst[3]..'\n\n📷تصویر: '..maxph[3]..'\n\n📃 متن: '..maxtex[3]..'\n\n📦 سایر: '..maxoth[3]
end
end
send_msg('channel#id'..cb_extra, text, ok_cb, true)
end
local function run(msg,matches)
if msg.to.type == 'channel' then
channel_get_users('channel#id'..msg.to.id, getactivech, msg.to.id)
elseif msg.to.type == 'chat' then
chat_info('chat#id'..msg.to.id, getactivegr, msg.to.id)
end
end
return {
  patterns = {
    "^[!/#]msguser$",
  }, 
  pre_process = pre_process,
  cron = cron,
  run = run
}