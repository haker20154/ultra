function run(msg,matches)
if matches[1] == 'mkeep' then
local bcolors = {'FFFFFF','000000','1F75FE','1CD3A2','FDBCB4','FF7538','EE204D'}
local tcolors = {'FFFFFF','000000','1F75FE','1CD3A2','FDBCB4','FF7538','EE204D'}
local url = "http://www.keepcalmstudio.com/-/p.php?t="..URL.escape(matches[2]).."&bc=E31F17&tc=FFFFFF&cc=FFFFFF&uc=true&ts=true&ff=PNG&w=512&ps=sq"
local bgcolor = bcolors[math.random(#bcolors)]
local textcolor = tcolors[math.random(#tcolors)]
if bgcolor ~= textcolor then
url = "http://www.keepcalmstudio.com/-/p.php?t="..URL.escape(matches[2]).."&bc="..bgcolor.."&tc="..textcolor.."&cc="..textcolor.."&uc=true&ts=true&ff=PNG&w=512&ps=sq"
end
local ph = download_to_file(url,"keep_calm.png")
send_document(get_receiver(msg),ph,ok_cb,false)
end
end
return {
patterns = {"^[!/#]([Mm]keep) (.*)$"},
run = run,
}