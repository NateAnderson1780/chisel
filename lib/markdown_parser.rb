require 'pry'

class MarkdownParser
  def initialize(input)
    @input = input
  end

  def convert_to_html
    # if !@input.include?("\n")
    #   @input.insert(0, "<p>").insert(-1, "</p>")
    # # elsif @input.include?("\n")
    # #   header_count = @input.count("#")
    # #   remove_hashes = @input.gsub("#", "")
    # #   front_space_removed = remove_hashes.sub(" ", "")
    # #   front_space_removed.insert(0, "<h#{header_count}>").insert(-1, "</h#{header_count}>")
    # elsif @input.include?("\n\n")
    #   newline_deleted = @input.sub("\n\n", "</p>\n<p>")
    #   newline_deleted.insert(0, "<p>").insert(-1, "</p>")
    # # elsif @input.include?("\n")
    # #   header_count = @input.count("#")
    #
    # elsif @input.include?("\n")
    #   newline_deleted = @input.sub("\n", " ")
    #   newline_deleted.insert(0, "<p>").insert(-1, "</p>")
    # new_input_array = @input.split("\n")
    # binding.pry
    # new_input_array.each do |line|
    #   if line[0] == "#"
    #     hash_count = line.count("#")
    #     remove_hashes = line.gsub("#", "")
    #     remove_lead_space = remove_hashes.sub(" ", "")
    #     headers = remove_lead_space.insert(0, "<h#{hash_count}>").insert(-1, "</h#{hash_count}>")
    #     binding.pry
    #     puts headers
    #   elsif !line[0] == "#" && line.count("\n") == 1
    #     new_paragraph = @input.insert(0, "<p>").insert(-1, "</p>")
    #     puts new_paragraph
    #   end

    # if !@input.include?("\n")
    #   @input.insert(0, "<p>").insert(-1, "</p>")
    # elsif @input.include?("\n\n")
    #   binding.pry
    #   newline_deleted = @input.gsub("\n\n", "</p>\n<p>")
    #   newline_deleted.insert(0, "<p>").insert(-1, "</p>")
    # elsif @input.include?("\n")
    #   newline_deleted = @input.sub("\n", " ")
    #   newline_deleted.insert(0, "<p>").insert(-1, "</p>")
    # end
    if @input.include?("\n\n\n")
      new_input = @input.split.join("\n\n")
    elsif @input[0] == "#" && @input.include?("\n")
      new_input = @input.sub("\n", "\n\n")
    else
      new_input = @input
    end

    new_input_array = new_input.split("\n\n")
    output = new_input_array.map do |line|
      if line[0] != "#"
       create_paragraph(line)
      elsif line[0] = "#"
        if line.include?("\n")
          new_line = line.split("\n")
          a = create_header(new_line[0])
          b = create_paragraph(new_line[1])
        else
          create_header(line)
        end
      end
    end
    output.join("\n")
  end

  def create_paragraph(line)
    line.insert(0, "<p>").insert(-1, "</p>\n")
  end

  def create_header(line)
    hash_count = line.count("#")
    remove_hashes = line.gsub("#", "")
    remove_lead_space = remove_hashes.sub(" ", "")
    headers = remove_lead_space.insert(0, "<h#{hash_count}>").insert(-1, "</h#{hash_count}>\n")
  end
end
