require 'pry'

class GildedRose
  attr_reader :name, :sell_in, :quality

  def initialize(name:, sell_in:, quality:)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def update_quality
    case name
    when 'Aged Brie'
      return update_brie
    else
      return update_normal
    end
     
    # if @name != "Aged Brie" and @name != "Backstage passes to a TAFKAL80ETC concert"
    #   if @quality > 0
    #     if @name != "Sulfuras, Hand of Ragnaros"
    #       @quality = @quality - 1
    #     end
    #   end
    # else
    #   if @quality < 50
    #     @quality = @quality + 1
    #     if @name == "Backstage passes to a TAFKAL80ETC concert"
    #       if @sell_in < 11
    #         if @quality < 50
    #           @quality = @quality + 1
    #         end
    #       end
    #       if @sell_in < 6
    #         if @quality < 50
    #           @quality = @quality + 1
    #         end
    #       end
    #     end
    #   end
    # end
    # if @name != "Sulfuras, Hand of Ragnaros"
    #   @sell_in = @sell_in - 1
    # end
    # if @sell_in < 0
    #   if @name != "Aged Brie"
    #     if @name != "Backstage passes to a TAFKAL80ETC concert"
    #       if @quality > 0
    #         if @name != "Sulfuras, Hand of Ragnaros"
    #           @quality = @quality - 1
    #         end
    #       end
    #     else
    #       @quality = @quality - @quality
    #     end
    #   else
    #     if @quality < 50
    #       @quality = @quality + 1
    #     end
    #   end
    # end
  end


  def update_brie
    @sell_in -= 1
    return if @quality >= 50

    @quality += 1
    @quality += 1 if @sell_in <= 0
  end

  def update_normal
    @sell_in -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @sell_in <= 0
  end
end
