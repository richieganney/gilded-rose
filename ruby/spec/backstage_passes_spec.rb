# frozen_string_literal: true

require 'backstage_pass'

describe BackstagePass do
  it '"Backstage passes" increases in quality by two points if its SellIn value is 10 days or less' do
    item = Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)
    BackstagePass.update_quality(item)
    expect(item.quality).to eq 32
  end

  it '"Backstage passes" increases in quality by three points if its SellIn value is 10 days or less' do
    item = Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)
    BackstagePass.update_quality(item)
    expect(item.quality).to eq 33
  end

  it '"Backstage passes" quality is zero if' do
    item = Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 30)
    BackstagePass.update_quality(item)
    expect(item.quality).to eq 0
  end
end
