require 'spec_helper'

describe 'Rectangle' do

  it 'should construct rectangle' do
    color =java.awt.Color.red
    rectangle = Rectangle.new(0,0, 100, 100, color)
    graphics = double(java.awt.Graphics)
    expect(graphics).to receive(:setColor).with(color).exactly(4).times
    expect(graphics).to receive(:drawLine).with(any_args).exactly(4).times
    rectangle.render graphics

  end

  context "#mouseClicked" do
    it "captures the mouse event inside rectangle" do
      color =java.awt.Color.red
      rectangle = Rectangle.new(0,0, 100, 100, color)
      java_event = double(java.awt.event.MouseEvent)
      allow(java_event).to receive(:x).and_return(5)
      allow(java_event).to receive(:y).and_return(5)
      expect(Kernel).to_not receive(:puts)
      rectangle.mouseClicked(java_event)
    end

    it "do not capture the mouse event outside rectangle" do
      color =java.awt.Color.red
      rectangle = Rectangle.new(0,0, 100, 100, color)
      java_event = double(java.awt.event.MouseEvent)
      allow(java_event).to receive(:x).and_return(100)
      allow(java_event).to receive(:y).and_return(130)
      expect(Kernel).to_not receive(:puts)
      rectangle.mouseClicked(java_event)
    end
  end

  context "#within_boundary?" do
    it "returns true for point within boundary" do
      color =java.awt.Color.red
      rectangle = Rectangle.new(0,0, 100, 100, color)
      expect(rectangle.within_boundary?(50,50)).to eq(true)
    end
  end


end