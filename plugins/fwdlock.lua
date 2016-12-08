local function pre_process(msg)
    local hash = 'fwdlock:'..msg.to.id
    if redis:get(hash) and msg.fwd_from and not is_momod(msg) then
            delete_msg(msg.id, ok_cb, true)
            return "done"
        end
        return msg
    end
local function run(msg, matches)
    chat_id =  msg.to.id
    if is_momod(msg) and matches[1] == 'lock' then
                    local hash = 'fwdlock:'..msg.to.id
                    redis:set(hash, true)
                    return "قفل فروارد فعال شد"
  elseif is_momod(msg) and matches[1] == 'unlock' then
                    local hash = 'fwdlock:'..msg.to.id
                    redis:del(hash)
                    return "قفل فروارد غیر فعال شد"
end
end
return {
    patterns = {
        '^[/!#](lock) fwd$',
        '^[/!#](unlock) fwd$'
    },
    run = run,
    pre_process = pre_process
}