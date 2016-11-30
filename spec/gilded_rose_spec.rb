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
    it 'shows correct balance' do
      brie = Item.new("Aged Brie", 20, 30)
      guilded_rose = GildedRose.new(brie)
      guilded_rose.update_quality
      expect(brie.to_s).to eq "Aged Brie, 19, 31"
    end

  end
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
