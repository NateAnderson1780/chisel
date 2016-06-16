require 'minitest/autorun'
require 'minitest/pride'
require './lib/chisel'

class ChiselTest < Minitest::Test
  def test_can_read_in_a_file_and_convert_to_string
    input = "./data/my_input.markdown"
    html  = "./data/my_output.html"

    chisel = Chisel.new(input, html)

    assert_equal "hello\n", chisel.to_s
  end
end
