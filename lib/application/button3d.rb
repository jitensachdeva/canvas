#Models 3D button and handles click on it
class Button3d

  def initialize x, y, width, height, label, color
    #@observers =[]
    @button = Button.new(x, y, width, height,label, color)
    shadow_width = 1

    top_left_x = x + shadow_width
    top_left_y = y + shadow_width

    @dark_border = java.awt.Color.red
    @light_border = java.awt.Color.blue

    @top_border_line = Line.new(top_left_x, top_left_y , top_left_x + width - 2*shadow_width , top_left_y, @dark_border)
    @left_border_line = Line.new(top_left_x, top_left_y , top_left_x  , top_left_y + height - 2*shadow_width, @dark_border)

    @bottom_border_line = Line.new( top_left_x  , top_left_y + height - 2*shadow_width, top_left_x + width - 2*shadow_width, top_left_y + height - 2*shadow_width , @light_border)
    @right_border_line = Line.new( top_left_x + width - 2*shadow_width , top_left_y , top_left_x + width - 2, top_left_y + height - 2*shadow_width , @light_border)

  end

  def render graphics
    @button.render graphics
    render_shadow_lines graphics

  end

  def mouseClicked(javaEvent)
  end

  def mousePressed(javaEvent)
   if @button.within_boundary?(javaEvent)
     p "mouse pressed"
     swap_line_colors @light_border , @dark_border
   end

  end

  def mouseReleased(javaEvent)
    if @button.within_boundary?(javaEvent)
      p "mouse released"
      swap_line_colors @dark_border, @light_border
    end

  end

  # def add_observer observer
  #   @observers << observer
  # end
  #
  # def notify_observers(event)
  #   @observers.each {|observer| observer.notify(event) }
  # end

  # def register_observer(observer, event_klass)
  #   @observers[event_klass] ||= []
  #   @observers[event_klass] << observer unless @observers[event_klass].include?(observer)
  # end
  #
  # def notify_observers(event)
  #   @observers[event.class].each { |observer| observer.notify(event) }
  # end

  private
  def swap_line_colors color1, color2
    @top_border_line.color = color1
    @left_border_line.color = color1

    @bottom_border_line.color = color2
    @right_border_line.color = color2
    notify_observer(ShapeChangeEvent.new)
  end



  def render_shadow_lines graphics
    @top_border_line.render graphics
    @left_border_line.render graphics
    @bottom_border_line.render graphics
    @right_border_line.render graphics
  end

end