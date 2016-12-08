local function run(msg,matches)
return string.reverse(matches[1])
end
return {
patterns =  {
'^[/#!]r (.*)$'
},
run = run
}