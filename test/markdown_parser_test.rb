require 'minitest/autorun'
require 'minitest/pride'
require './lib/markdown_parser'

class MarkdownParserTest < Minitest::Test
  def test_can_parse_paragraph
    markdown = MarkdownParser.new("This is the first line of the paragraph.")

    assert_equal "<p>This is the first line of the paragraph.</p>", markdown.convert_to_html
  end

  def test_can_parse_multi_line_paragraph
    input = "This is the first line of the paragraph.\nThis is the second line of the same paragraph."

    markdown = MarkdownParser.new(input)

    assert_equal "<p>This is the first line of the paragraph. This is the second line of the same paragraph.</p>", markdown.convert_to_html
  end

  def test_can_parse_multi_line_paragraph_with_many_single_new_lines
    input = "first\nsecond\nthird"

    markdown = MarkdownParser.new(input)

    assert_equal "<p>first second third</p>", markdown.convert_to_html
  end

  def test_can_parse_multi_line_paragraph_with_middle_blank
    input = "This is the first line of the first paragraph.\n\nThis is the first line of the second paragraph."

    markdown = MarkdownParser.new(input)

    assert_equal "<p>This is the first line of the first paragraph.</p>
<p>This is the first line of the second paragraph.</p>", markdown.convert_to_html
  end

  def test_paragraph_that_will_break_program
    input = "first\n\nsecond\n\nthird"

    markdown = MarkdownParser.new(input)

    assert_equal "<p>first</p>\n<p>second</p>\n<p>third</p>", markdown.convert_to_html
  end

  def test_paragraphs_with_multiple_new_lines
    skip
    input = "first\n\n\nsecond"

    markdown = MarkdownParser.new(input)

    assert_equal "<p>first</p>\n<p>second</p>", markdown.convert_to_html
  end

  def test_can_parse_a_single_header

    markdown = MarkdownParser.new("## Here's an H2")

    assert_equal "<h2>Here's an H2</h2>", markdown.convert_to_html
  end

  def test_can_parse_header_and_paragraph
    skip
    input1 = "# Header
followed by text"
    input2 = "<h1>Header</h1>
<p>followed by text</p>"

    markdown = MarkdownParser.new(input1)

    assert_equal input2, markdown.convert_to_html
  end

end
