require 'sulfuras'

describe 'sulfuras' do
  it 'is a legendary item: quality is always 80 and it never has to be sold' do
    item = Item.new('Sulfuras, Hand of Ragnaros', 0, 80)
    Sulfuras.update_quality(item)
    expect(item.quality).to eq 80
    expect(item.sell_in).to eq 0
  end
end
