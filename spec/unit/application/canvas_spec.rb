require 'spec_helper'

describe '#addLine' do

  let (:frame) {
    double("frame")
  }
  before (:each) {

    allow(frame).to receive(:setDefaultCloseOperation)
    allow(frame).to receive(:setSize)
    allow(frame).to receive(:setVisible).and_return(false)
    allow(frame).to receive(:add)
    allow(frame).to receive(:validate)
    allow(frame).to receive(:repaint)
  }

  it 'should should add line for rendering' do
    allow(javax.swing.JFrame).to receive(:new).and_return(frame)
    canvas = Canvas.new
    expect(frame).to receive(:repaint).with(no_args)
    canvas.addShape(Line.new(0,0,100, 100, java.awt.Color.red))
    canvas.repaint

  end
end