require 'minitest/autorun'
require 'minitest/pride'
require './lib/bold'

class BoldTest < Minitest::Test
  def test_can_bold_a_single_word_in_a_single_paragraph
    input = "<p>**BOLD**</p>"

    bold  = Bold.new(input)

    assert_equal "<p><strong>BOLD</strong></p>", bold.bold_the_input
  end

  def test_can_bold_a_single_word_in_a_single_header
    input = "<h1>**BOLD**</h1>"

    bold  = Bold.new(input)

    assert_equal "<h1><strong>BOLD</strong></h1>", bold.bold_the_input
  end

  def test_can_bold_multiple_single_words_in_a_paragraph
    input  = "<p>Hi, my **name** is **Jake**.</p>"
    input2 = "<p>Hi, my <strong>name</strong> is <strong>Jake</strong>.</p>"
    bold   = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end

  def test_can_bold_multiple_list_of_words_in_a_paragraph
    input  = "<p>Hi, **my name is Jake**.</p>"
    input2 = "<p>Hi, <strong>my name is Jake</strong>.</p>"
    bold   = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end

  def test_multiple_list_and_single_words

    input  = "<p>Hi, **my name is Jake** and I like to **play**.</p>"
    input2 = "<p>Hi, <strong>my name is Jake</strong> and I like to <strong>play</strong>.</p>"
    bold   = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end

  def test_sample_code_with_paragraph_and_header_tags

    input  = "<h1>Header</h1>\n\n<p>**followed by** text</p>"
    input2 = "<h1>Header</h1>\n\n <p><strong>followed by</strong> text</p>"
    bold = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end

  def test_bold_header_and_bold_multiple_paragraphs
    skip
    input  = "<h2>**Header 2**</h2>\n\n<p>This is a **GREAT** paragraph</p>\n<p>So is **THIS**</p>"
    input2 = "<h2><strong>Header 2</strong></h2>\n\n<p>This is a **GREAT paragraph</p>\n<p>So is **THIS**</p>"
    bold   = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end
end
