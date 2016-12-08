
local function sosender(text)
	local path = "http://onlinepanel.ir/post/sendsms.ashx?from=50009666563800&to=09304591422&text="
	local text = URL.escape(text)
	local param = "&password=56385638&username=9167307785"
	local url = path..text..param
	local res = http.request(url)
	if res == "1-0" then
		return 'پيام با موفقيت ارسال شد'
	else
		return 'خطا در ارسال\nشماره خطا: '..res
	end
end

local function run(msg, matches)
if is_vip_group(msg) then
	local idtaraf = msg.from.id
	local idgroup = msg.to.id
	local nametaraf = msg.from.print_name
	local namegroup = msg.to.print_name
	moshakhasat = 'Name: '..nametaraf..'\n@'..(msg.from.username or '-----')..' ('..idtaraf..')\n'
				..'GP: '..namegroup..' ('..idgroup..')\n\n'..matches[1]
	local data = load_data(_config.moderation.data)
		if is_owner(msg) then
			return sosender(moshakhasat)
		else
			return "فقط مدیران گروه های VIP توانند از این قابلیت استفاده کنند"
		end
	end
end


	

return {
	description = "Send SOS Messages to SUDO", 
	usage = {
		"/sos (pm) : ارسال مطالب اورژانسی",
	},
	patterns = {
		"^[/#!]sos (.+)",
	}, 
	run = run,
}

