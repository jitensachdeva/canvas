require 'spec_helper'

describe '#mouseClicked' do
  let (:java_event) {
    double(java.awt.event.MouseEvent)
  }
  let (:offset){
    20
  }

  it 'should say clicked when clicked inside boundary' do
    color =java.awt.Color.red
    label = "First Button"
    button = Button.new(0,0, 100, 100, label, color)
    allow(java_event).to receive(:x).and_return(5)
    allow(java_event).to receive(:y).and_return(20)
    expect(Kernel).to receive(:puts).with("#{label} -clicked: #{java_event.x} #{java_event.y - offset}")
    button.mouseClicked(java_event)
  end

  it 'should say nothing when clicked outside boundary' do
    color =java.awt.Color.red
    label = "First Button"
    button = Button.new(0,0, 100, 100, label, color)
    allow(java_event).to receive(:x).and_return(5)
    allow(java_event).to receive(:y).and_return(5)
    expect(Kernel).to_not receive(:puts)
    button.mouseClicked(java_event)
  end

end