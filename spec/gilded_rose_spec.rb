require 'rspec'
# require 'test/unit/assertions'
require './lib/gilded_rose'
require './lib/item'



describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      item = Item.new("foo", 0, 0)
      GildedRose.new(item).update_quality()
      expect(item.name).to eq "foo"
    end
  end

  context 'Add "Aged Brie"' do
    it 'shows correct balance on the following day (days down by 1, quality up by 1)' do
      brie = Item.new("Aged Brie", 20, 30)
      guilded_rose = GildedRose.new(brie)
      guilded_rose.update_quality
      expect(brie.to_s).to eq "Aged Brie, 19, 31"
    end
    it 'does not exceed 50' do
      brie = Item.new("Aged Brie", 20, 30)
      guilded_rose = GildedRose.new(brie)
      40.times { guilded_rose.update_quality }
      expect(brie.to_s).to eq "Aged Brie, -20, 50"
    end
  end

  context 'Add "Sulfuras"' do
    it 'shows correct balance on the following day (days + quality the same)' do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 20, 30)
      guilded_rose = GildedRose.new(sulfuras)
      guilded_rose.update_quality
      expect(sulfuras.to_s).to eq "Sulfuras, Hand of Ragnaros, 20, 30"
    end
    it 'stays the same' do
      sulfuras = Item.new("Sulfuras, Hand of Ragnaros", 20, 30)
      guilded_rose = GildedRose.new(sulfuras)
      40.times { guilded_rose.update_quality }
      expect(sulfuras.to_s).to eq "Sulfuras, Hand of Ragnaros, 20, 30"
    end
  end

  context 'Add "Sulfuras"' do
    it 'shows correct balance on the following day  (days down by 1, quality up by 1)' do
      b_stage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 40)
      guilded_rose = GildedRose.new(b_stage_passes)
      guilded_rose.update_quality
      expect(b_stage_passes.to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 19, 41"
    end
    it 'does not exceed 50' do
      b_stage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 40)
      guilded_rose = GildedRose.new(b_stage_passes)
      20.times { guilded_rose.update_quality }
      expect(b_stage_passes.to_s).to eq "Backstage passes to a TAFKAL80ETC concert, 0, 50"
    end
    it 'reduces to zero when days countdown < zero' do
      b_stage_passes = Item.new("Backstage passes to a TAFKAL80ETC concert", 20, 40)
      guilded_rose = GildedRose.new(b_stage_passes)
      21.times { guilded_rose.update_quality }
      expect(b_stage_passes.to_s).to eq "Backstage passes to a TAFKAL80ETC concert, -1, 0"
    end
  end

  context 'Addin other types of non-special items' do
    it 'shows correct balance on the following day  (days down by 1, quality down by 1)' do
      normal_item = Item.new("Normal Item", 20, 40)
      guilded_rose = GildedRose.new(normal_item)
      guilded_rose.update_quality
      expect(normal_item.to_s).to eq "Normal Item, 19, 39"
    end

    it 'quality reduces 2 times faster once "sell by" is passed (days down by 1, quality down by 2)' do
      normal_item = Item.new("Normal Item", 1, 40)
      guilded_rose = GildedRose.new(normal_item)
      15.times { guilded_rose.update_quality }
      expect(normal_item.to_s).to eq "Normal Item, -14, 11"
    end

  end

  # context 'Add "Conjured"' do
  #   it 'shows correct balance on the following day  (days down by 1, quality down by 2)' do
  #     conjured = Item.new("Conjured", 20, 40)
  #     guilded_rose = GildedRose.new(conjured)
  #     guilded_rose.update_quality
  #     expect(conjured.to_s).to eq "Conjured, 19, 38"
  #   end
  # end
end




# describe GildedRose do
#
#   let(:brie) {double(:item, name: "Aged Brie", sell_in: 20, quality: 30)}
#
#
#   context 'Add "Aged Brie"' do
#     before do
#       allow(:brie).to receive(:quality)
#       guilded_rose = GildedRose.new(brie)
#       guilded_rose.update_quality
#       # print brie.to_s
#     end
#
#     it 'shows correct balance' do
#       expect(brie.to_s).to eq "Aged Brie, 19, 31"
#     end
#
#   end
#
# end
