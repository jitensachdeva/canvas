require 'java'
import java.awt.Color
#import javax.swing.JFrame
require_relative 'Line'
require_relative 'Rectangle'
require_relative 'Button'


puts "#{RUBY_PLATFORM}"
class Canvas < javax.swing.JPanel
  include java.awt.event.MouseListener

  def initialize
    @shapes = []
    super
    @frame = javax.swing.JFrame.new("Canvas")
    @frame.setDefaultCloseOperation(javax.swing.JFrame::EXIT_ON_CLOSE)
    @frame.setSize(800, 600)
    @frame.setVisible(true)
    @frame.addMouseListener(self)
    @frame.add(self)
    repaint
  end

  def repaint
    @frame.validate
    @frame.repaint
  end

  def addShape(shape)
    @shapes << shape
  end

  def paintComponent(graphics)
    super(graphics)
    paint(graphics)
  end


  def paint(graphics)
    @shapes.each {|shape| shape.render(graphics)}
  end

  def keyPressed(javaEvent);end
  def keyReleased(javaEvent);end
  def mouseEntered(javaEvent);end
  def mouseExited(javaEvent);end
  def mousePressed(javaEvent);end
  def mouseReleased(javaEvent);end

  def mouseClicked(javaEvent)
    @shapes.each {|shape| shape.mouseClicked(javaEvent)}
  end

end

canvas = Canvas.new
# line1 = Line.new(0,0,100, 100, java.awt.Color.red)
# line2 = Line.new(100,100,0, 10, java.awt.Color.black)
button = Button.new(10,10, 100, 100,"First Button", java.awt.Color.blue)
button1 = Button.new(10,10, 50, 50,"Second Button", java.awt.Color.red)
# canvas.addShape(line1)
# canvas.addShape(line2)
canvas.addShape(button)
canvas.addShape(button1)
canvas.repaint
