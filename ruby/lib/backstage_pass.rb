# frozen_string_literal: true

class BackstagePass
  def self.update_quality(item)
    raise 'Cannot assess this item. Try again' unless item.name.include?('Backstage passes')
    item.sell_in -= 1
    if item.sell_in <= 10 && item.sell_in > 5
      item.quality += 2
    elsif item.sell_in <= 5 && item.sell_in >= 1
      item.quality += 3
    else item.sell_in <= 0
      item.quality = 0
    end
  end
end
