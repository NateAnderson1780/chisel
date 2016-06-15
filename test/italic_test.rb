require 'minitest/autorun'
require 'minitest/pride'
require './lib/italic'

class ItalicTest < Minitest::Test
  def test_can_italicize_a_word_in_a_paragraph
    input = "<p>*ITALIC*</p>"

    italic = Italic.new(input)

    assert_equal "<p><em>ITALIC</em></p>", italic.italicize_the_input
  end

  def test_can_italicize_a_word_in_a_header
    input = "<h1>*ITALIC*</h1>"

    italic = Italic.new(input)

    assert_equal "<h1><em>ITALIC</em></h1>", italic.italicize_the_input
  end

  def test_can_italicize_multiple_words_in_a_paragraph
    input = "<p>*ITALIC this sentence*.</p>"

    italic = Italic.new(input)

    assert_equal "<p><em>ITALIC this sentence</em>.</p>", italic.italicize_the_input
  end

  def test_can_italicize_multiple_words_in_a_header
    input = "<h2>*ITALIC this sentence*.</h2>"

    italic = Italic.new(input)

    assert_equal "<h2><em>ITALIC this sentence</em>.</h2>", italic.italicize_the_input
  end

  def test_can_italicize_multiple_words_in_a_header_and_paragraph
    input  = "<h2>*ITALIC this sentence*.</h2>\n\n<p>*ITALIC this sentence*.</p>"
    input2 = "<h2><em>ITALIC this sentence</em>.</h2>\n\n<p><em>ITALIC this sentence</em>.</p>"

    italic = Italic.new(input)

    assert_equal input2, italic.italicize_the_input
  end

  def test_can_italicize_single_and_multiple_words
    input  = "<p>*I* am going for *a walk*.</p>\n\n<h2>*The Walk Begins*</h2>\n\n<p>The *walk* ends *now*.</p>"
    input2 = "<p><em>I</em> am going for <em>a walk</em>.</p>\n\n<h2><em>The Walk Begins</em></h2>\n\n<p>The <em>walk</em> ends <em>now</em>.</p>"

    italic = Italic.new(input)

    assert_equal input2, italic.italicize_the_input
  end
end
