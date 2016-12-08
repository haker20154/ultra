function run(msg,matches)
  if is_admin1(msg) and matches[1] == 'add' then
    redis:sadd("VIP:GROUPS",msg.to.id)
    return "VIP Group Added"
  end
  if is_admin1(msg) and matches[1] == 'rem' then
     redis:del("VIP:GROUPS",msg.to.id)
    return "VIP Group Removed"
  end
end
return {
  patterns = {
    "^[!/#]([Aa]dd) ([Vv]ip)$",
    "^[!/#]([Rr]em) ([Vv]ip)$",
  },
  run = run
}