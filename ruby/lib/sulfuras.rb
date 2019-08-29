class Sulfuras

  def self.update_quality(item) 
    raise 'Cannot assess this item. Try again' if !item.name.include?("Sulfuras")
  end
end