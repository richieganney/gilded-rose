# frozen_string_literal: true

class Foo
  MINIMUM_QUALITY = 0

  def self.update_quality(item)
    special_items = ['Aged Brie', 'Sulfuras', 'Backstage passes', 'Conjured']
    special_items.each do |items|
      raise 'Cannot assess this item. Try again' if items[0..8].include?(item.name)
    end
    item.quality -= item.sell_in < 0 ? 2 : 1
    item.sell_in -= 1
    item.quality = 0 if item.quality < MINIMUM_QUALITY
  end
end
