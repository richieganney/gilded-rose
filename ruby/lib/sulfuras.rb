# frozen_string_literal: true

class Sulfuras
  def self.update_quality(item)
    raise 'Cannot assess this item. Try again' unless item.name.include?('Sulfuras')
  end
end
