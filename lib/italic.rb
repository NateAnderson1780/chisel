require 'pry'


class Italic
  def initialize(input)
    @input = input
  end

  def italicize_the_input
     @input.split("\n\n").map do |element|
        a = element.sub(">*", "><em>")
        b = a.sub("*<", "</em><")
        c = b.gsub(" *", " <em>")
        d = c.gsub("* ", "</em> ")
        e = d.gsub("*.", "</em>.")
     end.join("\n\n")
  end
end
