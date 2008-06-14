#!/usr/bin/env ruby -wKU

require File.dirname(__FILE__) + '/../lib/monome'

class Random
  def initialize
    @monome = Monome::Monome.new
  end
  
  def start
    100.times do
      sleep 0.1
      @monome.all
      @monome.clear
    end
  end
  
end

Random.new.start