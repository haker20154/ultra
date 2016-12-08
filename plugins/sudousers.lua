local function sudo()
local sudo_users = _config.sudo_users
local text = Sudo Users :\n"
for i=1,#sudo_users do
    text = text..i.."-"..sudo_users[i].."\n"
end
return text
end
local function run(msg, matches)
if matches[1] == 'sudo' and is_sudo(msg) then
return sudo()
    end
end
return {
  patterns = {
    "^[#!/](sudo)$",
  },
  run = run
}