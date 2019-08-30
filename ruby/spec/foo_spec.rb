# frozen_string_literal: true

require 'foo'

describe Foo do
  let(:item) { double :item }

  describe '#update_quality' do
    it 'does not change the name' do
      item = Item.new('orange', 0, 0)
      Foo.update_quality(item)
      expect(item.name).to eq 'orange'
    end

    it 'once the sell by date has passed, quality degrades twice as fast' do
      item = Item.new('apple', -1, 20)
      Foo.update_quality(item)
      expect(item.quality).to eq 18
    end

    it 'raises an error if item includes any of the special items' do
      item = Item.new('Aged Brie', 10, 10)
      item_2 = Item.new('Sulfuras, Hand of Ragnaros', 10, 10)
      expect { Foo.update_quality(item) }.to raise_error 'Cannot assess this item. Try again'
    end

    it 'the quality of an item is never negative' do
      item = Item.new('foo', -1, 0)
      Foo.update_quality(item)
      expect(item.quality).not_to be < 0
    end

    it '"Conjured" items degrade twice as fast' do
      item = Item.new('Conjured', 5, 10)
      Foo.update_quality(item)
      expect(item.quality).to eq 8
    end
  end
end
