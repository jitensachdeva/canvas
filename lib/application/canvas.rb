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
    #shape.add_observer(self)
  end

  # def process_observe_request
  #   @frame.repaint
  # end

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
  def mousePressed(javaEvent)
    @shapes.each {|shape| shape.mousePressed(javaEvent)}
  end
  def mouseReleased(javaEvent)
    @shapes.each {|shape| shape.mouseReleased(javaEvent)}

  end

  def mouseClicked(javaEvent)
    @shapes.each {|shape| shape.mouseClicked(javaEvent)}
  end

end

