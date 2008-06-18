#!/usr/bin/env jruby -wKU

#introduction of a nicer api, natively supporting threads (without you needing to know about it)

require File.dirname(__FILE__) + '/../lib/monomer'

class Toggle < Monomer::Listener
  
  before_start do
    puts 'starting midi'
    @midi = Monomer::MidiOut.new
    puts 'midi ready'
  end
  
  on_key_down do |x,y|
    @midi.on (y * 8 + x)
    monome.toggle_led(x,y)
  end

end

Monomer::Monome.create.with_listeners(Toggle).start if $0 == __FILE__