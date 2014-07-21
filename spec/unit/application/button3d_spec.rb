require 'spec_helper'

describe 'process click events' do

  it 'should be able to draw a 3D button' do

    color =java.awt.Color.red
    dark_border = java.awt.Color.black
    light_border = java.awt.Color.blue

    button3d = Button3d.new(0,0, 100, 100,"First 3DButton", color)
    graphics = double(java.awt.Graphics)
    expect(graphics).to receive(:setColor).with(color).exactly(4).times
    expect(graphics).to receive(:setColor).with(dark_border).exactly(2).times

    expect(graphics).to receive(:setColor).with(light_border).exactly(2).times

    expect(graphics).to receive(:drawLine).with(0,0,100,0).exactly(1).times
    expect(graphics).to receive(:drawLine).with(0,0,0,100).exactly(1).times
    expect(graphics).to receive(:drawLine).with(100,0,100,100).exactly(1).times
    expect(graphics).to receive(:drawLine).with(0,100,100,100).exactly(1).times

    expect(graphics).to receive(:drawLine).with(1,1,99,1).exactly(1).times
    expect(graphics).to receive(:drawLine).with(1,1,1,99).exactly(1).times
    expect(graphics).to receive(:drawLine).with(99,1,99,99).exactly(1).times
    expect(graphics).to receive(:drawLine).with(1,99,99,99).exactly(1).times
    button3d.render graphics
  end
end