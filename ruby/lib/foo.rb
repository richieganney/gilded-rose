class Foo

  def initialize(item)
    @item = item
  end

  def self.update_quality(item)
    special_items = ["Aged Brie", "Sulfuras", "Backstage passes", "Conjured"]
    special_items.each do |items|
        raise "Cannot assess this item. Try again" if items[0..8].include?(item.name)
    end
    if item.sell_in < 0
      item.quality -=2 
    end   
  end
end