# model and render rectangle
class Rectangle
  def initialize(x1,y1, width, height, color)
    @x1 = x1
    @y1 = y1
    @width = width
    @height = height
    @color = color

  end

  def render graphics
    @lines = [
        Line.new(@x1,@y1, @x1+ @width, @y1, @color) ,
        Line.new(@x1,@y1, @x1, @y1 + @height, @color) ,
        Line.new(@x1 + @width,@y1, @x1+ @width, @y1 +@height, @color) ,
        Line.new(@x1,@y1 +@height, @x1+ @width, @y1 + @height, @color) ]

    @lines.each do |line|
      line.render graphics
    end
  end

  def mouseClicked(javaEvents) end

  #TODO add specs for within_boundary
  def within_boundary? (x, y)
    (x >= @x1 && x <= (@x1+@width)) && (y >= @y1 && y <= (@y1 + @height))
  end


end