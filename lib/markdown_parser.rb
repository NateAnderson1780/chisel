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
    new_input_array = @input.split("\n\n")

    new_input_array.map do |line|
      if line.include?("\n#") && !line.start_with?("\n#")
        line.gsub!("\n#", "\n\n#")
        new_lines = line.split("\n\n")
        new_lines.map do |element|
          header.create_header(element)
        end
      elsif line.include?("\n") && !line.start_with?("\n")
        if line.start_with?("#")
          new_lines = line.split("\n")
          new_lines.map do |element|
            if element.start_with?("#")
              header.create_header(element)
            else
              paragraph.create_paragraph(element)
            end
          end
        else
          paragraph.create_paragraph(line)
        end
      elsif line.start_with?("#")
        header.create_header(line)
      elsif line.start_with?("\n")
        line.slice!(0)
        if line.start_with?("#")
          header.create_header(line)
        else
          paragraph.create_paragraph(line)
        end
      elsif !line.start_with?("#")
        paragraph.create_paragraph(line)
      end
    end.join("\n")
  end
end
