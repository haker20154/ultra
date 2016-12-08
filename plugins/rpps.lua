local function run(msg,matches)
local 1 = 
‎"شما : كاغذ👤\nكرول : قيچی🤖\n\n⭐️كرول برد⭐️",
‎"شما : كاغذ👤\nكرول : سنگ🤖\n\n⭐️شما برديد⭐️",
‎"شما : كاغذ👤\nکرول : کاغذ🤖\n\n⭐️مساوی⭐️",
local 2 = 
‎"شما : سنگ👤\nكرول : قيچی🤖\n\n⭐️شما برديد⭐️",
‎"شما : سنگ👤\nكرول : سنگ🤖\n\n⭐️مساوی⭐️",
‎"شما : سنگ👤\nکرول : کاغذ🤖\n\n⭐️كرول برد⭐️",
local 3 = 
‎"شما : قيچی👤\nكرول : قيچی🤖\n\n⭐️شما برديد⭐️",
‎"شما : قیچی👤\nكرول : سنگ🤖\n\n⭐️مساوی⭐️",
‎"شما : قیچی👤\nکرول : کاغذ🤖\n\n⭐️كرول برد⭐️",
if matches[1] == "rps" then
if matches[2] == "سنگ" then
2[math.random(#2)]
if matches[2] == "کاغذ" then
1[math.random(#1)]
if matches[2] == "قیچی" then
3[math.random(#3)]
end
end
end
end
return {
patterns = {
"^[/!#]([Rr]ps) (.*)$"
},
run = run
}