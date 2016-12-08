local function run(msg, matches)

 local receiver = get_receiver(msg)
     send_document(receiver, "nerkh.webp", ok_cb, false)
end

return { 
patterns = {
"^[/\!#][Nn]erkh$"
},
run = run 
}