# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'once the sell by date has passed, quality degrades twice as fast' do
      items = [Item.new('foo', -1, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 18
    end

    it 'the quality of an item is never negative' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).not_to be < 0
    end

    it '"Aged Brie" actually increases in quality the older it gets' do
      items = [Item.new('Aged Brie', 0, 45)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to be > 45
    end

    it 'the quality of an item is never more than 50' do
      items = [Item.new('Aged Brie', 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).not_to be > 50
    end

    it '"Backstage passes" increases in quality by two points if its SellIn value is less than 10 days' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 32
    end

    it '"Backstage passes" increases in quality by three points if its SellIn value is less than 5 days' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 33
    end

    it '"Backstage passes" quality drops to zero when its SellIn value surpasses zero' do
      items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 30)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end
end

# DONE
