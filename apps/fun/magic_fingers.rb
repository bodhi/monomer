#!/usr/bin/env jruby -wKU

require File.dirname(__FILE__) + '/../../lib/monomer'

class MagicFingers < Monomer::Listener
  
  on_any_button_press do |x,y|
    draw_toggle_square(x,y,1)
  end
  
  def self.draw_toggle_square(x,y,size)
    monome.toggle_led(x + size ,y + size)
    monome.toggle_led(x + size ,y       )
    monome.toggle_led(x        ,y + size)
    monome.toggle_led(x - size ,y - size)
    monome.toggle_led(x - size ,y       )
    monome.toggle_led(x        ,y - size)
    monome.toggle_led(x - size ,y + size)
    monome.toggle_led(x + size ,y - size)
  end
  
end

Monomer::Monome.create.with_listeners(MagicFingers).start  if $0 == __FILE__
