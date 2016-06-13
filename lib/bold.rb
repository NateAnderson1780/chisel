require 'pry'

class Bold
  def initialize(input)
    @input = input
  end

  def bold_the_input
    output = @input.split.map do |element|
      if element.count("*") == 4
        new_element = element.sub("**", "<strong>")
        new_element.sub("**", "</strong>")
      elsif element.start_with?("**")
        new_element = element.sub("**", "<strong>")
      elsif element.include?("**")
        new_element = element.sub("**", "</strong>")
      else
        element
      end
    end
    return output.join(" ")
  end
end
