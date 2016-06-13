require 'minitest/autorun'
require 'minitest/pride'
require './lib/markdown_parser'

class MarkdownParserTest < Minitest::Test
  def test_can_parse_paragraph
    markdown = MarkdownParser.new("This is the first line of the paragraph.")

    assert_equal "<p>This is the first line of the paragraph.</p>\n", markdown.convert_to_html
  end

  def test_can_parse_multi_line_paragraph
    input = "This is the first line of the paragraph.\nThis is the second line of the same paragraph."

    markdown = MarkdownParser.new(input)

    assert_equal "<p>This is the first line of the paragraph.\nThis is the second line of the same paragraph.</p>\n", markdown.convert_to_html
  end

  def test_can_parse_multi_line_paragraph_with_many_single_new_lines
    input = "first\nsecond\nthird"

    markdown = MarkdownParser.new(input)

    assert_equal "<p>first\nsecond\nthird</p>\n", markdown.convert_to_html
  end

  def test_can_parse_multi_line_paragraph_with_middle_blank
    input = "This is the first line of the first paragraph.\n\nThis is the first line of the second paragraph."

    markdown = MarkdownParser.new(input)

    assert_equal "<p>This is the first line of the first paragraph.</p>\n\n<p>This is the first line of the second paragraph.</p>\n", markdown.convert_to_html
  end

  def test_paragraph_that_will_break_program
    input = "first\n\nsecond\n\nthird"

    markdown = MarkdownParser.new(input)

    assert_equal "<p>first</p>\n\n<p>second</p>\n\n<p>third</p>\n", markdown.convert_to_html
  end

  def test_paragraphs_with_multiple_new_lines

    input = "first\n\n\nsecond"

    markdown = MarkdownParser.new(input)

    assert_equal "<p>first</p>\n\n<p>second</p>\n", markdown.convert_to_html
  end

  def test_can_parse_a_single_header

    markdown = MarkdownParser.new("## Here's an H2")

    assert_equal "<h2>Here's an H2</h2>\n", markdown.convert_to_html
  end

  def test_can_parse_multiple_headers

    input = "### Header 3\n## Header 2"

    markdown = MarkdownParser.new(input)

    assert_equal "<h3>Header 3</h3>\n\n<h2>Header 2</h2>\n", markdown.convert_to_html
  end

  def test_can_parse_header_and_paragraph

    input1 = "# Header\nfollowed by text"
    input2 = "<h1>Header</h1>\n\n<p>followed by text</p>\n"

    markdown = MarkdownParser.new(input1)

    assert_equal input2, markdown.convert_to_html
  end

  def test_can_parse_various_header_levels
    input1 = "# Header1\n## Header 2\n\n### Header 3\n\n\n#### Header 4"
    input2 = "<h1>Header1</h1>\n\n<h2>Header 2</h2>\n\n<h3>Header 3</h3>\n\n<h4>Header 4</h4>\n"
    markdown = MarkdownParser.new(input1)

    assert_equal input2, markdown.convert_to_html
  end

  def test_various_headers_and_paragraphs
    skip
    input1 = "# Header 1\n\n\nfirst paragraph\n2nd line of first paragraph\n\n\n## Header 2\n\nfirst\n\n\nsecond"
    input2 = "<h1>Header 1</h1>\n\n<p>first paragraph\n2nd line of first paragraph</p>\n\n<h2>Header 2</h2>\n\n<p>first</p>\n\n<p>second</p>\n"

    markdown = MarkdownParser.new(input1)

    assert_equal input2, markdown.convert_to_html
  end
end
