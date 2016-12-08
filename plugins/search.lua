local function run(msg,matches)
  local text = matches[2]
  if matches[1] == 'search' then
    search(get_receiver(msg),text,ok_cb,false)
    end 
  end
return {
  patterns = {
    "^[/#!]search (.*)$"
  },
  run = run
}