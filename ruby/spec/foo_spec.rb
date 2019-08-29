require 'foo'

describe Foo do
  let(:item) { double :item}

  describe "#update_quality" do
    it "does not change the name" do
      item = Item.new("foo", 0, 0)
      Foo.update_quality(item)
      expect(item.name).to eq "foo"
    end

    it 'once the sell by date has passed, quality degrades twice as fast' do
      item = Item.new("foo", -1, 20)
      Foo.update_quality(item)
      expect(item.quality).to eq 18
    end
  end
end