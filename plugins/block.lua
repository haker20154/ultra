local function block_user_callback(cb_extra, success, result)
  local user = 'user#id'..result.id
  if success == 0 then
    return "اين يوزر بلوک نميشود"
  end
  block_user(user, cb_ok, false)
end

local function unblock_user_callback(cb_extra, success, result)
  local user = 'user#id'..result.id
  unblock_user(user, cb_ok, false)
end

local function run(msg, matches)
  if matches[1] == '+' then
    local user = 'user#id'..matches[2]
    block_user(user, callback, false)
    return "انجام شد"
  else
    local user = 'user#id'..matches[2]
    unblock_user(user, callback, false)
    return "انجام شد"
  end
end

return {
  patterns = {
    "^[Bb]lock ([-+]) (%d+)$",
  }, 
  run = run,
  privileged = true
}