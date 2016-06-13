class Header
  def create_header(line)
    hash_count = line.count("#")
    remove_hashes = line.gsub("#", "")
    remove_lead_space = remove_hashes.sub(" ", "")
    headers = remove_lead_space.insert(0, "<h#{hash_count}>").insert(-1, "</h#{hash_count}>\n")
  end
end
