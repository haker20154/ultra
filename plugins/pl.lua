local function run(msg,matches)

return get_self(get_reciver(msg),ok_cb,false)

end
return {
patterns = {
"^/pl$"
},
run = run 
}