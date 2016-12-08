local function run(msg,matches)
local text = ''
text = text..'<a href="https://telegram.me/cruel_help/2">خاموش روشن کردن ربات</a>\n'
  text = text..'<a href="https://telegram.me/cruel_help/3">اخراج شخص از گروه</a>'
return text
  end

return {
patterns = {
"^راهنما$",
},
run = run
}