require './lib/markdown_parser'
require 'pry'

class Chisel
  def initialize(input, html)
    @markdown_file_name = input.split("/").last
    @html_file_name = html.split("/").last
    @input = File.read(input)
    @markdown_lines = @input.lines.count
    @html  = html
    @markdown_parser = MarkdownParser.new(@input)
  end

  def convert_and_save
    html_text = @markdown_parser.convert_to_html
    send_to_html_file(html_text)
  end

  def send_to_html_file(text)
    File.write(@html, text)
    html_lines = File.read(@html).lines.count
    puts "Converted #{@markdown_file_name} (#{@markdown_lines} lines) to #{@html_file_name} (#{html_lines} lines)"
  end
end

chisel = Chisel.new(ARGV[0], ARGV[1])
chisel.convert_and_save
