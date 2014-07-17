#handles click event
class Button < Rectangle

  def initialize(x1,y1, width, height, label, color)
    @label = label
    super(x1,y1, width, height, color)
  end


  def mouseClicked(javaEvent)
    offset = 20
    Kernel.puts "#{@label} -clicked: #{javaEvent.x} #{(javaEvent.y - offset)}" if within_boundry?(javaEvent.x,(javaEvent.y - offset) )
  end


end
