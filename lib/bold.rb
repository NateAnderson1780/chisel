require 'pry'

class Bold
  def initialize(input)
    @input = input
  end

  def bold_the_input
    @input.split("\n\n").map do |element|
        a = element.sub(">**", "><strong>")
        b = a.sub("**<", "</strong><")
        c = b.gsub(" **", " <strong>")
        d = c.gsub("** ", "</strong> ")
        e = d.gsub("**.", "</strong>.")
    end.join("\n\n")
  end
end
