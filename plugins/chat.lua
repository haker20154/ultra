---------------database
aslf = http.request('http://shayanpanapa.ir/rep.db')
botf = http.request('http://shayanpanapa.ir/bot.db')
gf = http.request('http://shayanpanapa.ir/g.db')
aslf = http.request('http://shayanpanapa.ir/asl.db')
khobif = http.request('http://shayanpanapa.ir/khoobi.db')
pvf = http.request('http://shayanpanapa.ir/pv.db')
repf = http.request('http://shayanpanapa.ir/rep.db')
slmf = http.request('http://shayanpanapa.ir/salam.db')
----------function
local function run(msg,matches)
  if matches[1] == 'slm' then
  local slm = slmf:split("،")
  return slm[math.random(#slm)]
    end 
  end

-----------return
return {
  patterns = {
    '^slm$'
  },
  run = run
}