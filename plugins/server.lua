local function run(msg,matches)

--commands for type in terminal

local memTotal_b = [[free -b |grep Mem |awk '{print $2}']]
local memFree_b = [[free -b |grep Mem |awk '{print $4}']]
local memBuffer_b = [[free -b |grep Mem |awk '{print $6}']]
local memCache_b = [[free -b |grep Mem |awk '{print $7}']]
local memTotal_m = [[free -m |grep Mem |awk '{print $2}']]
local memFree_m = [[free -m |grep Mem |awk '{print $4}']]
local memBuffer_m = [[free -m |grep Mem |awk '{print $6}']]
local memCache_m = [[free -m |grep Mem |awk '{print $7}']]
local CPUPer = [[top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}']]
local hdd = [[df -lh | awk '{if ($6 == "/") { print $5 }}' | head -1 | cut -d'%' -f1]]
local uptime = [[uptime]]
local ProcessCnt = [[ps -A | wc -l]]

--io.popen 
 local io_memTotal_b = io.popen(memTotal_b):read('*all')
 local io_memFree_b = io.popen(memFree_b):read('*all')
 local io_memBuffer_b = io.popen(memBuffer_b):read('*all')
local io_memCache_b = io.popen(memCache_b):read('*all')
local io_memTotal_m = io.popen(memTotal_m):read('*all')
local io_memFree_m = io.popen(memFree_m):read('*all')
local io_memBuffer_m = io.popen(memBuffer_m):read('*all')
local  io_memCache_m= io.popen(memCache_m):read('*all')
local io_CPUPer = io.popen(CPUPer):read('*all')
local  io_hdd= io.popen(hdd):read('*all')
local io_ProcessCnt = io.popen(ProcessCnt):read('*all')
--uptime
 local up = io.popen('uptime'):read('*all')
local tr = up:gsub('days','روز')
local t = tr:gsub('up','تا')
local x = t:gsub('load average','بار متوسط')
local uptime = x:gsub('users','تعداد یوزر ها(کاربران)')


--return commands
local text = 'مشخصات سرور شما :\n'
text=text..'uptime : '..uptime..'\n'
text=text..'HDD : '..io_hdd..'\n'
text=text..'Memory Total : '..io_memTotal_b..'\n'
text=text..'Memory Free : '..io_memFree_b..'\n'
text=text..'Memory Buffer : '..io_memBuffer_b..'\n'
text=text..'Cpu Per : '..io_CPUPer..'\n'
text=text..'ProcessCnt : '..io_ProcessCnt..'\n'
return text
end

-- return plugin
return {
patterns = {
'^[/#!]server$'
},
run = run
}