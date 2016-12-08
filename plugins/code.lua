local function run(msg, matches)
local site = matches[2]:lower()
source = io.popen('cd data && wget '..site)
res = source:read('*all')
local folder = '/root/TeleSeed'
local path = '.html'
local file = folder..'/data/'..msg.from.id..':'..site..':index'..path
mv = io.popen('mv '..folder..'/data/index'..path..' '..file):read('*all')
send_document(get_receiver(msg), file, ok_cb, false)
end
return {
  patterns = {
    "^([Cc]ode) (.*)$",
  "^[!/#]([Cc]ode) (.*)$",
  },
  run = run
}