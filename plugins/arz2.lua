function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

--------toman
local function t(msg, matches)
local url = 'https://tarfandbazar.ir/API/index.php?arz=true'
  local jstr, res = https.request(url)
  local arz = json:decode(jstr)
  local text = 'مبلغ مورد نظر شما : '..matches[2]..' تومان'
local dollar = matches[2] / arz.dollar.value  
  local dollar_rasmi = matches[2] / arz.dollar_rasmi.value
  local euro = matches[2] / arz.euro.value
  local derham = matches[2] / arz.derham.value
  local pond = matches[2] / arz.pond.value
 text = text..'\nمعادل '..round(dollar,2)..' 💸دلار'
 text = text..'\nمعادل '.. round(dollar_rasmi,2)..' 💵دلار رسمی'
 text = text..'\nمعادل '..round(euro,2) ..' 💶یورو'
 text = text..'\nمعادل '..round(derham,2) ..' 💴درهم'
 text = text..'\nمعادل '..round(pond,2) ..' 💷پوند میباشد'
return text
end

-----------euro
local function e(msg, matches)
local url = 'https://tarfandbazar.ir/API/index.php?arz=true'
  local jstr, res = https.request(url)
  local arz = json:decode(jstr)
  local text = 'مبلغ مورد نظر شما : '..matches[2]..' تومان'
  local dollar = matches[2] / arz.dollar.value  
  local dollar_rasmi = matches[2] / arz.dollar_rasmi.value
  local euro = matches[2] / arz.euro.value
  local derham = matches[2] / arz.derham.value
  local pond = matches[2] / arz.pond.value
 text = text..'\nمعادل '..round(dollar,2)..' 💸دلار'
 text = text..'\nمعادل '.. round(dollar_rasmi,2)..' 💵دلار رسمی'
 text = text..'\nمعادل '..round(euro,2) ..' 💶یورو'
 text = text..'\nمعادل '..round(derham,2) ..' 💴درهم'
 text = text..'\nمعادل '..round(pond,2) ..' 💷پوند میباشد'
return text
end

--------run
local function run(msg,matches)
  if matches[1] == 'tarz' then
    return t(msg,matches)
  
  end
  end

return {
  patterns = {
"^[/#!](earz) (%d+)$",
    "^[/#!](tarz) (%d+)$",
    "^[/#!](darz) (%d+)$",
    "^[/#!](parz) (%d+)$"
  }, 
  run = run 
}