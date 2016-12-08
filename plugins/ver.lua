do
local function admin_list(msg)
    local data = load_data(_config.moderation.data)
        local admins = 'admins'
        if not data[tostring(admins)] then
        data[tostring(admins)] = {}
        save_data(_config.moderation.data, data)
        end
        local message = '🎗لیست ادمین ها :\n'
        for k,v in pairs(data[tostring(admins)]) do
                message = message .. '>🏅 @' .. v ..'\n'
        end
        return message
end
local function run(msg, matches)
local kham = io.popen('uptime'):read('*all')
local uptime = kham:split(",")[1]
local admins = admin_list(msg)
local data = load_data(_config.moderation.data)
local group_link = data[tostring(1065958052)]['settings']['set_link']
local channel = '@CH_NEWS'
local owner = '@IT_MKH'
local htp = https.request('https://translate.yandex.net/api/v1.5/tr.json/translate?key=trnsl.1.1.20160119T111342Z.fd6bf13b3590838f.6ce9d8cca4672f0ed24f649c1b502789c9f4687a&format=plain&lang=fa&text='..uptime)
local data = json:decode(htp)
local up = data.text[1]
local privator = '@MKH_PV_BOT'
local space = '______________________________'
if not group_link then
group_link = "Unset"
end
return "#Cruel_Bot\n\n⏱مدت زمان روشن بودن :\n"..up.."\n"..space.."\n💢 نویسنده و صاحب امتیاز ربات : "..owner.."\n"..admins.."\n"..space.."\n\n📢 کانال رسمی اخبار تیم کرول : "..channel.."\n\n🤖ربات پیام رسان برای ارتباط باما (برای افراد ریپورت) : "..privator.."\n\n 🔰لینک ساپورت🔰 :\n"..group_link
end
return {
patterns = {
"^[!/#][Cc][Rr][Uu][Ee][Ll]$",
},
run = run
}
end