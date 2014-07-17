require 'java'

java_import 'javax.swing.JFrame'
java_import 'javax.swing.JPanel'
java_import 'java.awt.Dimension'
java_import 'java.awt.Graphics'
java_import 'java.awt.event.MouseEvent'
java_import 'java.awt.event.MouseMotionListener'
java_import 'java.awt.event.MouseListener'

class DrawPanel < JPanel
  include MouseMotionListener
  include MouseListener
  attr_accessor :draw_x, :draw_y

  def paint_component(graphics)
    graphics.draw_oval(@draw_x, @draw_y, 10, 10)
  end

  def mouse_dragged(event)
    @draw_x = event.x
    @draw_y = event.y
    repaint
  end

  def mouse_clicked(event)
    p event
    p "xxxxxxx"
    p event.x
    p event.y
  end

  def mouse_entered(event)
  end

  def mouse_exited(event)
  end

  def mouse_pressed(event)
  end

  def mouse_released(event)
  end


  def mouse_moved(event)
  end

  alias_method :mouseDragged, :mouse_dragged
  alias_method :mouseMoved, :mouse_moved
  alias_method :paintComponent, :paint_component

  alias_method :mouseEntered, :mouse_entered
  alias_method :mouseClicked, :mouse_clicked
  alias_method :mouseExited, :mouse_exited
  alias_method :mousePressed, :mouse_pressed
  alias_method :mouseReleased, :mouse_released
end

frame = JFrame.new 'JRuby Paint'
frame.size = Dimension.new 640, 480
panel = DrawPanel.new
panel.add_mouse_motion_listener(panel)
panel.add_mouse_listener(panel)
frame.add panel
frame.visible = true