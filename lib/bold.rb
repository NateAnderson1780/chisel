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
      elsif element.start_with?("**") || element.start_with?("<p>**")
        element.sub("**", "<strong>")
      elsif element.include?("**")
        element.sub("**", "</strong>")
      elsif element.start_with?("<h")
        element.insert(-1, "\n\n")
      else
        element
      end
    end.join(" ")
  end
end
