require 'pry'

module GildedRose
  def self.new(name:, sell_in:, quality:)
    class_for(name).new(sell_in: sell_in, quality: quality)
  end

  def self.class_for(name)
    case name
    when 'Aged Brie'
      Brie
    when 'Sulfuras, Hand of Ragnaros'
      Sulfuras
    when 'Backstage passes to a TAFKAL80ETC concert'
      Backstage
    when 'Conjured'
      Conjured
    else
      Normal
    end
  end

  class Brie
    attr_reader :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in, @quality = sell_in, quality
    end
     
    def update_quality
      @sell_in -= 1
      return if @quality >= 50

      @quality += 1 
      @quality += 1 if @sell_in <= 0 and @quality < 50
    end
  end

  class Normal
    attr_reader :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in, @quality = sell_in, quality
    end
     
    def update_quality
      @sell_in -= 1
      return if @quality == 0

      @quality -= 1
      @quality -= 1 if @sell_in <= 0
    end
  end

  class Sulfuras
    attr_reader :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in, @quality = sell_in, quality
    end
     
    def update_quality; end
  end

  class Backstage
    attr_reader :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in, @quality = sell_in, quality
    end
     
    def update_quality
      @sell_in -= 1
      return if quality >= 50
      return @quality = 0 if @sell_in < 0

      @quality += 1
      @quality += 1 if @sell_in < 10
      @quality += 1 if @sell_in < 5
    end
  end

  class Conjured
    attr_reader :sell_in, :quality

    def initialize(sell_in:, quality:)
      @sell_in, @quality = sell_in, quality
    end
     
    def update_quality
      @sell_in -= 1
      return if @quality == 0

      @quality -= 2
      @quality -= 2 if @sell_in <= 0
    end
  end
end
