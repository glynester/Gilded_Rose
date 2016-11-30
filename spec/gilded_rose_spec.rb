require 'rspec'
require 'test/unit/assertions'
require './lib/gilded_rose'

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      # items[0].name.should == "fixme"
      expect(items[0].name).to eq "foo"
    end
  end

end
