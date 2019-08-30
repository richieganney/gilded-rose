# frozen_string_literal: true

require 'item'
require 'gilded_rose'
require 'foo'
require 'backstage_pass'
require 'aged_brie'
require 'sulfuras'
require 'pry'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == 'Aged Brie'
        AgedBrie.update_quality(item)
      elsif item.name.include?('Backstage pass')
        BackstagePass.update_quality(item)
      elsif item.name.include?('Sulfuras')
        Sulfuras.update_quality(item)
      else
        Foo.update_quality(item)
      end
    end
  end
end

binding.pry
