#Models 3D button and handles click on it
class Button3d

  def initialize x, y, width, height, label, color
    @button = Button.new(x, y, width, height,label, color)
    shadow_width = 1

    top_left_x = x + shadow_width
    top_left_y = y + shadow_width

    dark_border = java.awt.Color.black
    light_border = java.awt.Color.blue

    @top_border_line = Line.new(top_left_x, top_left_y , top_left_x + width - 2*shadow_width , top_left_y, dark_border)
    @left_border_line = Line.new(top_left_x, top_left_y , top_left_x  , top_left_y + height - 2*shadow_width, dark_border)

    @bottom_border_line = Line.new( top_left_x  , top_left_y + height - 2*shadow_width, top_left_x + width - 2*shadow_width, top_left_y + height - 2*shadow_width , light_border)
    @right_border_line = Line.new( top_left_x + width - 2*shadow_width , top_left_y , top_left_x + width - 2, top_left_y + height - 2*shadow_width , light_border)

  end

  def render graphics
    @button.render graphics
    render_shadow_lines graphics

  end

  def mouseClicked
    # swap_line_colors
    # render_shadow
  end

  private

  def render_shadow graphics

    @top_border_line.render graphics
    @left_border_line.render graphics
    @bottom_border_line.render graphics
    @right_border_line.render graphics

  end

end