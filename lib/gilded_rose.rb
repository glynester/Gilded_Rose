require_relative 'item'
# (name, sell_in, quality)

class GildedRose
  def initialize(*items)
    @items = items
    @goods = {aged_brie: "Aged Brie", conjured: "Conjured Mana Cake",
    sulfuras:  "Sulfuras, Hand of Ragnaros",
    backstage_passes: "Backstage passes to a TAFKAL80ETC concert"}
    p @items
    @items.each {|item|
      if @goods.key(item.name)
        eval((@goods.key(item.name)).to_s)
      else
        std_item
      end
    }
  end


    def std_item
      @name = "std_item"
      @sell_in = -1                  # Decreases by 1
      @quality = -1                  # Decreases by 1
      @past_sell_in_quality = -2     # Decreases by 2
      @quality_direction = "down"    # Quality goes down
      @quality_limit = 0             # Cannot go below 0.
      update_quality
    end

    def conjured
      @name = "Conjured Mana Cake"
      @sell_in = -1                  # Decreases by 1
      @quality = -2                  # Decreases by 2
      @past_sell_in_quality = -4     # Decreases by 4
      @quality_direction = "down"    # Quality goes down
      @quality_limit = 0             # Cannot go below 0.
      update_quality
    end

    def aged_brie
      @name = "aged_brie"
      @sell_in = -1                  # Decreases by 1
      @quality = 1                   # Increases
      @past_sell_in_quality = "N/A"  # Never gets to past "sell_in"
      @quality_direction = "up"      # Quality goes up
      @quality_limit = 50            # Cannot go above 50.
      update_quality
    end

    def sulfuras
      @name = "Sulfuras, Hand of Ragnaros"
      @sell_in = 0                   # Does not change
      @quality = 0                   # Does not change
      @past_sell_in_quality = "N/A"  # Never gets to past "sell_in"
      @quality_direction = "same"    # Quality goes down
      @quality_limit = "N/A"         # Never gets to past "quality_limit"
      update_quality
    end

    def backstage_passes
      @name = "Backstage passes to a TAFKAL80ETC concert"
      @sell_in = 0                   # Does not change
      @quality = 0                   # Does not change
      @past_sell_in_quality = "N/A"  # Never gets to past "sell_in"
      @quality_direction = "same"    # Quality goes down
      @quality_limit = "N/A"         # Never gets to past "quality_limit"
      update_quality
    end





  def update_quality()
    # @items.each do |item|
      p @name


  #     if item.name != "Aged Brie" and item.name != "Backstage passes to a TAFKAL80ETC concert"
  #       if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
  #           item.quality = item.quality - 1
  #       end
  #     else
  #       if item.quality < 50
  #         item.quality = item.quality + 1
  #         if item.name == "Backstage passes to a TAFKAL80ETC concert"
  #           if item.sell_in < 6
  #               item.quality = item.quality + 2
  #           elsif item.sell_in < 11
  #               item.quality = item.quality + 1
  #           end
  #         end
  #       end
  #     end
  #     if item.name != "Sulfuras, Hand of Ragnaros"
  #       item.sell_in = item.sell_in - 1
  #     end
  #     if item.sell_in < 0
  #
  #       if item.name == "Aged Brie"
  #         if item.quality < 50
  #           item.quality = item.quality + 1
  #         end
  #       else
  #         if item.name != "Backstage passes to a TAFKAL80ETC concert"
  #           if item.quality > 0 && item.name != "Sulfuras, Hand of Ragnaros"
  #               item.quality = item.quality - 1
  #           end
  #         else
  #           item.quality = item.quality - item.quality
  #         end
  #       end
  #     end
  #   end
  # end
end
end
