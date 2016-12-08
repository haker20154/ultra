local function run(msg)
if not is_vip_group(msg) then
return "فقط در گروه های vip امکان پذیر است"
end

  local url = http.request('http://api.avirateam.ir/irna/cli/index.php?pass=dN@-Sy1k$mKB2PgWoj)7/9vbDL0VCpfA')
  return url
end

return {
  patterns = {
    "^[!/#]([Nn][Ee][Ww][Ss])$"
  },
  run = run
}
