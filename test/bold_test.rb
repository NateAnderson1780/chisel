require 'minitest/autorun'
require 'minitest/pride'
require './lib/bold'

class BoldTest < Minitest::Test
  def test_can_bold_a_single_word
    input = "**BOLD**"

    bold = Bold.new(input)

    assert_equal "<strong>BOLD</strong>", bold.bold_the_input
  end

  def test_can_bold_multiple_single_words
    input  = "Hi, my **name** is **Jake**."
    input2 = "Hi, my <strong>name</strong> is <strong>Jake</strong>."
    bold   = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end

  def test_can_bold_multiple_list_of_words
    input  = "Hi, **my name is Jake**."
    input2 = "Hi, <strong>my name is Jake</strong>."
    bold   = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end

  def test_multiple_list_and_single_words
    input  = "Hi, **my name is Jake** and I like to **play**."
    input2 = "Hi, <strong>my name is Jake</strong> and I like to <strong>play</strong>."
    bold   = Bold.new(input)

    assert_equal input2, bold.bold_the_input
  end
end
