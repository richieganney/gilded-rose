class Foo

  def initialize(item)
    @item = item
  end

  def self.update_quality(item)
    raise "Cannot assess this item. Try again" if item.name != "foo"
    if item.sell_in < 0
      item.quality -=2 
    end   
  end
end