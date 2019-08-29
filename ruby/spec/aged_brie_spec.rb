# frozen_string_literal: true

require 'aged_brie'

describe '#update_quality' do
  it '"Aged Brie" actually increases in quality the older it gets' do
    item = Item.new('Aged Brie', 0, 40)
    AgedBrie.update_quality(item)
    expect(item.quality).to be > 40
  end

  it 'the quality of an item is never more than 50' do
    item = Item.new('Aged Brie', 0, 50)
    AgedBrie.update_quality(item)
    expect(item.quality).not_to be > 50
  end
end
