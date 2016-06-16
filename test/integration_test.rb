require 'minitest/autorun'
require 'minitest/pride'
require './lib/markdown_parser'

class IntegrationTest < Minitest::Test
  def test_headers_and_bold_work_together
    input = "# Header 1\n\nSample **text**."

    integration = MarkdownParser.new(input)

    assert_equal "<h1>Header 1</h1>\n\n<p>Sample <strong>text</strong>.</p>\n", integration.convert_to_html
  end

  def test_headers_and_bold_and_italic_work_together
    input  = "## Header 2\n\n**Sample** *text*\n\n**More Sample text**"

    integration = MarkdownParser.new(input)

    expected = "<h2>Header 2</h2>\n\n<p><strong>Sample</strong> <em>text</em></p>\n\n<p><strong>More Sample text</strong></p>\n"
    assert_equal expected, integration.convert_to_html
  end
end
