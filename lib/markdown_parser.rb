require 'pry'
require_relative 'header'
require_relative 'paragraph'

class MarkdownParser
  attr_accessor :header, :paragraph
  def initialize(input)
    @input = input
    @header = Header.new
    @paragraph = Paragraph.new
  end

  def convert_to_html
    # if @input.include?("\n\n\n")
    #   new_input = @input.split.join("\n\n")
    #   binding.pry
    # elsif @input[0] == "#" && @input.include?("\n")
    #   new_input = @input.sub("\n", "\n\n")
    # else
    #   new_input = @input
    # end

    # new_input_array = @input.split("\n\n")
    # puts new_input_array.inspect
    # output = new_input_array.map do |line|
    #   if line[0] != "#"
    #    paragraph.create_paragraph(line)
    #   elsif line[0] = "#"
    #     if line.include?("\n")
    #       new_line = line.split("\n")
    #       a = header.create_header(new_line[0])
    #       b = paragraph.create_paragraph(new_line[1])
    #     else
    #       header.create_header(line)
    #     end
    #   end
    # end
    # output.join("\n")
    new_input_array = @input.split("\n\n")

    new_input_array.map do |line|
      if line.include?("\n#")
        line.gsub!("\n#", "\n\n#")
        new_line = line.split("\n\n")
        new_line.map do |element|
          header.create_header(element)
        end
      elsif line.start_with?("#")
        header.create_header(line)
      elsif line.start_with?("\n")
        line.slice!(0)
        paragraph.create_paragraph(line)
      elsif !line.start_with?("#")
        paragraph.create_paragraph(line)
      end

      # if SOMETHING
      #   then return a header
      # elsif SOMETHING
      #   then return a paragraph
      # elsif SOMETHING
      #   then return a header & a paragraph
      # end
    end.join("\n")

    # new_input = @input.split("\n")
    # output = new_input.each_cons(3).map do |line, next_line, third_line|
    #   if line == ""
    #     line.delete("")
    #   elsif line[0] == "#"
    #     header.create_header(line)
    #   elsif next_line == ""
    #     paragraph.create_paragraph(line)
    #   elsif next_line[0] != "#"
    #     new_line = line + "\n" + next_line
    #     paragraph.create_paragraph(new_line)
    #   end
    #   binding.pry
    #   output.join("\n")
    # end
  end
end
