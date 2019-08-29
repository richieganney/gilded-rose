# frozen_string_literal: true

require 'gilded_rose'

describe GildedRose do
  let(:item) { double :item }

  describe '#update_quality' do
    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'once the sell by date has passed, quality degrades twice as fast' do
      items = [Item.new('foo', 0, 20)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 18
    end

    it 'the quality of an item is never negative' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).not_to be < 0
    end

    it '"Aged Brie" actually increases in quality the older it gets' do
      items = [Item.new('Aged Brie', 0, 40)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to be > 40
    end

    it 'the quality of an item is never more than 50' do
      items = [Item.new('Aged Brie', 0, 50)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).not_to be > 50
    end

      # DONE

    it 'the quality of an item is never more than 50' do
      items = [Item.new('Sulfuras, Hand of Ragnaros', 0, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
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
  # describe '#update_conjured_item' do
  #   it 'degrades in quality twice as fast as normal items' do
  #     items = [Item.new("Conjured", 10, 30)]
  #     GildedRose.new(items).update_conjured_item
  #     expect(items[0].quality).to eq 28
  #   end
  # end
end
