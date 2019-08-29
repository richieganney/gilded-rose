# frozen_string_literal: true

class AgedBrie
  MAXIMUM_QUALITY = 50

  def self.update_quality(item)
    raise 'Cannot assess this item. Try again' if item.name != 'Aged Brie'

    item.sell_in -= 1
    item.quality += 1
    item.quality = 50 if item.quality > MAXIMUM_QUALITY
  end
end
