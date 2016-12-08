do

local BASE_URL = 'http://api.giphy.com/v1'
local API_KEY = 'dc6zaTOxFJmzC'

local function get_image(response)
  local images = json:decode(response).data
  if #images == 0 then return nil end 
  local i = math.random(#images)
  local image =  images[i]

  if image.images.downsized then
    return image.images.downsized.url
  end

  if image.images.original then
    return image.original.url
  end

  return nil
end

local function get_random_top()
  local url = BASE_URL.."/gifs/trending?api_key="..API_KEY
  local response, code = http.request(url)
  if code ~= 200 then return nil end
  return get_image(response)
end

local function search(text)
  text = URL.escape(text)
  local url = BASE_URL.."/gifs/search?q="..text.."&api_key="..API_KEY
  local response, code = http.request(url)
  if code ~= 200 then return nil end
  return get_image(response)
end

local function run(msg, matches)
  local gif_url = nil
  
  if matches[1] == "gif" or matches[1] == "giphy" then
    gif_url = get_random_top()
  else
    gif_url = search(matches[1])
  end

  if not gif_url then 
    return "Error: GIF not found"
  end

  local receiver = get_receiver(msg)
  print("GIF URL"..gif_url)
  
  send_document_from_url(receiver, gif_url)
end

return {
  description = "GIFs from telegram with Giphy API",
  usage = {
    "!gif (term): Search and sends GIF from Giphy. If no param, sends a trending GIF.",
    "!giphy (term): Search and sends GIF from Giphy. If no param, sends a trending GIF."
    },
  patterns = {
    "^[/#!](gif)$",
    "^[/#!](gif) (.*)",
  },
  run = run
}

end