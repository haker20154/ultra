local function download(msg,matches)
if is_admin1(msg) then
    local url = matches[1]
    local  file = download_to_file(url,matches[2])
      send_document(get_receiver(msg), file, ok_cb, false)
    end
  end

return {
  patterns = {
    "^[/#!]download (.*) (.*)$"
  },
  run = download
}