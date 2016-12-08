

local function run(msg, matches)
if not is_vip_group(msg) then
return "فقط در گروه های vip امکان پذیر است"
end

	if matches[1]:lower() == 'aparat' then
		local url = http.request('http://www.aparat.com/etc/api/videoBySearch/text/'..URL.escape(matches[2]))
		local jdat = json:decode(url)

		local items = jdat.videobysearch
		text = 'نتیجه جستجو در آپارات: \n'
		for i = 1, #items do
		text = text..'\n\n'..i..' -'..items[i].title..'\nتعداد بازدید : '..items[i].visit_cnt..'\nلینک ویدیو : http://aparat.com/v/'..items[i].uid
		end
		text = text..'\n\n@CH_NEWS'
		return text
	end
end

return {
   patterns = {
"^[#/!](aparat) (.*)$",
   },
   run = run
}
