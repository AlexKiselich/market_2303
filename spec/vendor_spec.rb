require 'rspec'
require './lib/item'
require './lib/vendor'

RSpec.describe Vendor do
  describe 'iteration1' do
    it 'exists and has attributes' do
      vendor = Vendor.new("Rocky Mountain Fresh")

      expect(vendor).to be_a(Vendor)
      expect(vendor.name).to eq("Rocky Mountain Fresh")
      expect(vendor.inventory).to eq({})
    end
  end

    describe '#check_stock' do
      it 'can start at 0 stock and also add items to inventory and their stock' do
        vendor = Vendor.new("Rocky Mountain Fresh")
        item1 = Item.new({name: 'Peach', price: "$0.75"})
        item2 = Item.new({name: 'Tomato', price: '$0.50'})
        
        expect(vendor.check_stock(item1)).to eq(0)
        
        vendor.stock(item1, 30)
        expect(vendor.inventory).to eq({item1 => 30})
        expect(vendor.check_stock(item1)).to eq(30)

        vendor.stock(item1, 25)
        expect(vendor.check_stock(item1)).to eq(55)

        vendor.stock(item2, 12)
        expect(vendor.inventory).to eq({item1 => 55, item2 => 12})
      end
    end
end