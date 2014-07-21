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


  def mouseClicked(javaEvent)
    offset = 20
    Kernel.puts "#{@label} -clicked: #{javaEvent.x} #{(javaEvent.y - offset)}" if @rectangle.within_boundary?(javaEvent.x,(javaEvent.y - offset) )
  end


end
