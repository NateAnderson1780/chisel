class Paragraph
  def create_paragraph(line)
    line.insert(0, "<p>").insert(-1, "</p>\n")
  end
end
