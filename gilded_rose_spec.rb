require File.join(File.dirname(__FILE__), 'gilded_rose')
require 'simplecov'
SimpleCov.start

describe GildedRose do
  describe '#update_quality' do
    context 'when the item is "normal"' do
      it 'reduces the quality by one' do
        item = GildedRose.new(name: 'foo', sell_in: 10, quality: 5)

        item.update_quality

        expect(item).to have_attributes(sell_in: 9, quality: 4)
      end

      it 'does something else' do
        skip 'Your turn...'
      end
    end
  end
end
