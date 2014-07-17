require 'spec_helper'
require 'rspec'

describe 'Line' do

  it 'should render line' do
    graphics = double(java.awt.Graphics)
    color =java.awt.Color.red
    line = Line.new(0,0,100,100, color)
    expect(graphics).to receive(:setColor).with(color)
    expect(graphics).to receive(:drawLine).with(0,0,100,100)
    line.render(graphics)
  end
end