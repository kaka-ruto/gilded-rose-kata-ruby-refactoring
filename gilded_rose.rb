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
    when 'Sulfuras, Hand of Ragnaros'
      return update_sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      return update_backstage
    else
      return update_normal
    end
  end


  def update_brie
    @sell_in -= 1
    return if @quality >= 50

    @quality += 1 
    @quality += 1 if @sell_in <= 0 and @quality < 50
  end

  def update_normal
    @sell_in -= 1
    return if @quality == 0

    @quality -= 1
    @quality -= 1 if @sell_in <= 0
  end

  def update_sulfuras; end

  def update_backstage
    @sell_in -= 1
    return if quality >= 50
    return @quality = 0 if @sell_in < 0

    @quality += 1
    @quality += 1 if @sell_in < 10
    @quality += 1 if @sell_in < 5
  end
end
