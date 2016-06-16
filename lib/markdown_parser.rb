require 'pry'
require_relative 'header'
require_relative 'paragraph'
require_relative 'bold'
require_relative 'italic'

class MarkdownParser
  attr_accessor :header, :paragraph
  def initialize(input)
    @input = input
    @header = Header.new
    @paragraph = Paragraph.new
  end

  def convert_to_html
    @input.gsub!("\n\n\n", "\n\n")                  
    paragraphs = @input.split("\n\n")               
    sections = paragraphs.chunk do |pg|             
      pg.start_with?("#")                           
    end

    parsed_paragraph_and_headers = sections.map do |starts_with_header, lines|     
      if starts_with_header                         
        compose_headers_and_paragraphs(lines)       
      else                                          
        compose_paragraphs(lines)                   
      end
    end.join("\n")  
    
    parsed_bold = Bold.new(parsed_paragraph_and_headers).bold_the_input
    Italic.new(parsed_bold).italicize_the_input                                
  end

  def compose_paragraphs(lines_of_text)
    lines_of_text.map do |paragraph_text|           
      paragraph.create_paragraph(paragraph_text)
    end.join("\n")
  end

  def compose_headers_and_paragraphs(lines_of_text)
    lines_of_text.map do |paragraph_text|           
      paragraph_text.split("\n").map do |line|      
        if header_line?(line)                       
          header.create_header(line)
        else                                        
          paragraph.create_paragraph(line)
        end
      end
    end.join("\n")
  end

  def header_line?(line)
    line.start_with?("#")
  end
end
