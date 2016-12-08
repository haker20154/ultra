local function run(msg, matches)
  local url = http.request('http://tarfandbazar.ir/API/alexa.php?url='..matches[1])
  local photo = 'http://tarfandbazar.ir/API/alexaphoto.php?url='..matches[1]

  return url.."\n\n"..photo
    end
return {
   patterns = {
"^[/#!]alexa (.*)$",
   },
   run = run
}