require 'java'
require_relative './application/canvas'
require_relative './application/line'
require_relative './application/rectangle'
require_relative './application/button'
require_relative './application/button3d'

class Application

  def initialize
    puts "Hello from Application"

    canvas = Canvas.new
# line1 = Line.new(0,0,100, 100, java.awt.Color.red)
# line2 = Line.new(100,100,0, 10, java.awt.Color.black)
    button = Button3d.new(10,10, 100, 100,"First Button", java.awt.Color.black)
    #button1 = Button.new(10,10, 50, 50,"Second Button", java.awt.Color.red)
# canvas.addShape(line1)
# canvas.addShape(line2)
#     button.add_observer(canvas)
    canvas.addShape(button)
   # canvas.addShape(button1)
    canvas.repaint

  end
end

