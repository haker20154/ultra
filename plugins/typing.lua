local function run(msg,matches)
  if matches[1] == 'tp' then
    send_typing(get_receiver(msg), ok_cb, false)
    end
  if matches[1] == 'tt' then
    send_typing_abort(get_receiver(msg), ok_cb, false)
    end
  end
return {
    patterns = {
      "^tp$",
      "^tt$"
    },
    run = run
  }