#handles click event
class Button

  def initialize(x1,y1, width, height, label, color)
    @label = label
    @rectangle = Rectangle.new(x1,y1, width, height, color)
  end

  #ToDO add specs for render
  def render graphics
    @rectangle.render graphics
  end

  def mousePressed(javaEvent)
  end

  def mouseReleased(javaEvent)
  end

  def mouseClicked(javaEvent)

    Kernel.puts "#{@label} -clicked: #{javaEvent.x} #{(javaEvent.y - offset)}" if within_boundary?(javaEvent)
  end


  def within_boundary?(javaEvent)
    offset = 20
    @rectangle.within_boundary?(javaEvent.x,(javaEvent.y - offset) )
  end

end
