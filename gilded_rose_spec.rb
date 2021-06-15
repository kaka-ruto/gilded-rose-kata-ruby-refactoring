require 'simplecov'
SimpleCov.start
require File.join(File.dirname(__FILE__), 'gilded_rose')

describe GildedRose do
  describe '#update_quality' do
    context 'when the item is "normal"' do
      it 'before sell date' do
        item = GildedRose.new(name: 'foo', sell_in: 10, quality: 5)

        item.update_quality

        expect(item).to have_attributes(sell_in: 9, quality: 4)
      end

      it 'on sell date' do
        item = GildedRose.new(name: "Normal", sell_in: 0, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: -1, quality: 8)
      end

      it "after sell date" do
        item = GildedRose.new(name: "Normal Item", sell_in: -10, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: -11, quality: 8)
      end

      it "of zero quality" do
        item = GildedRose.new(name: "Normal Item", sell_in: 5, quality: 0)

        item.update_quality

        expect(item).to have_attributes(sell_in: 4, quality: 0)
      end
    end

    context "Aged Brie" do
      it "before sell date" do
        item = GildedRose.new(name: "Aged Brie", sell_in: 5, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: 4, quality: 11)
      end

      it "with max quality" do
        item = GildedRose.new(name: "Aged Brie", sell_in: 5, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: 4, quality: 50)
      end

      it "on sell date" do
        item = GildedRose.new(name: "Aged Brie", sell_in: 0, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: -1, quality: 12)
      end

      it "on sell date near max quality" do
        item = GildedRose.new(name: "Aged Brie", sell_in: 0, quality: 49)

        item.update_quality

        expect(item).to have_attributes(sell_in: -1, quality: 50)
      end

      it "on sell date with max quality" do
        item = GildedRose.new(name: "Aged Brie", sell_in: 0, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: -1, quality: 50)
      end

      it "after sell date" do
        item = GildedRose.new(name: "Aged Brie", sell_in: -10, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: -11, quality: 12)
      end

      it "after sell date with max quality" do
        item = GildedRose.new(name: "Aged Brie", sell_in: -10, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: -11, quality: 50)
      end
    end

    context "Sulfuras" do
      it "before sell date" do
        item = GildedRose.new(name: "Sulfuras, Hand of Ragnaros", sell_in: 5, quality: 80)

        item.update_quality

        expect(item).to have_attributes(sell_in: 5, quality: 80)
      end

      it "on sell date" do
        item = GildedRose.new(name: "Sulfuras, Hand of Ragnaros", sell_in: 0, quality: 80)

        item.update_quality

        expect(item).to have_attributes(sell_in: 0, quality: 80)
      end

      it "after sell date" do
        item = GildedRose.new(name: "Sulfuras, Hand of Ragnaros", sell_in: -10, quality: 80)

        item.update_quality

        expect(item).to have_attributes(sell_in: -10, quality: 80)
      end
    end

    context "Backstage Pass" do
      it "long before sell date" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: 10, quality: 11)
      end

      it "long before sell date at max quality" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 11, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: 10, quality: 50)
      end

      it "medium close to sell date upper bound" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: 9, quality: 12)
      end

      it "medium close to sell date upper bound at max quality" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 10, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: 9, quality: 50)
      end

      it "medium close to sell date lower bound" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: 5, quality: 12)
      end

      it "medium close to sell date lower bound at max quality" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 6, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: 5, quality: 50)
      end

      it "very close to sell date upper bound" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: 4, quality: 13)
      end

      it "very close to sell date upper bound at max quality" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 5, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: 4, quality: 50)
      end

      it "very close to sell date lower bound" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: 0, quality: 13)
      end

      it "very close to sell date lower bound at max quality" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 1, quality: 50)

        item.update_quality

        expect(item).to have_attributes(sell_in: 0, quality: 50)
      end

      it "on sell date" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: 0, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: -1, quality: 0)
      end

      it "after sell date" do
        item = GildedRose.new(name: "Backstage passes to a TAFKAL80ETC concert", sell_in: -10, quality: 10)

        item.update_quality

        expect(item).to have_attributes(sell_in: -11, quality: 0)
      end
    end
  end
end
