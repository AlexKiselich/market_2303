require 'rspec'
require './lib/item'
require './lib/vendor'
require './lib/market'

RSpec.describe Market do
  describe 'Iteration2' do
    it 'exists and has attributes' do
      market = Market.new("South Pearl Street Farmers Market")

      expect(market).to be_a(Market)
      expect(market.name).to eq( "South Pearl Street Farmers Market")
      expect(market.vendors).to eq([])
    end
  end

  describe '#add_vendors' do
    it 'can add vendors to the market' do
      market = Market.new("South Pearl Street Farmers Market")

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack") 

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.vendors).to eq([vendor1, vendor2, vendor3])
    end
  end

  describe '#vendor_names' do
    it 'can give the names of the vendors' do
      market = Market.new("South Pearl Street Farmers Market")

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack") 

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.vendor_names).to eq(["Rocky Mountain Fresh", "Ba-Nom-a-Nom", "Palisade Peach Shack"])
    end
  end

  describe '#vendors_that_sell' do
    it 'can show what vendors sell a certian item' do
      market = Market.new("South Pearl Street Farmers Market")

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack") 

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.vendors_that_sell(item1)).to eq([vendor1, vendor3])
      end
    end

  describe 'vendors potential_revenue' do
    it 'can calculate potential revenue' do
      market = Market.new("South Pearl Street Farmers Market")

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack") 

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(vendor1.potential_revenue).to eq(29.75)
      expect(vendor2.potential_revenue).to eq(345.00)
      expect(vendor3.potential_revenue).to eq(48.75)
    end
  end

  describe '#sorted_item_list' do
    it 'can show the names of all the items in stock,  alphabetically and no duplicates' do
      market = Market.new("South Pearl Street Farmers Market")

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      expect(market.sorted_item_list).to eq(["Banana Nice Cream", "Peach", "Peach-Raspberry Nice Cream", "Tomato"])
    end
  end

  describe '#total_inventory' do
    it 'can show the total inventory of all items in the market' do
      market = Market.new("South Pearl Street Farmers Market")

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      vendor1.stock(item1, 35)
      vendor3.stock(item1, 65)

      market.add_vendor(vendor1)
      market.add_vendor(vendor3)

      expect(market.total_inventory).to eq({item1 => {:quantity => 65, :vendors => [vendor1, vendor3]}})
    end
  end

  describe '#overstocked_items' do
    it 'check to see if an item is overstocked' do
      market = Market.new("South Pearl Street Farmers Market")

      vendor1 = Vendor.new("Rocky Mountain Fresh")
      vendor2 = Vendor.new("Ba-Nom-a-Nom")
      vendor3 = Vendor.new("Palisade Peach Shack")

      item1 = Item.new({name: 'Peach', price: "$0.75"})
      item2 = Item.new({name: 'Tomato', price: "$0.50"})
      item3 = Item.new({name: "Peach-Raspberry Nice Cream", price: "$5.30"})
      item4 = Item.new({name: "Banana Nice Cream", price: "$4.25"})

      market.add_vendor(vendor1)
      market.add_vendor(vendor2)
      market.add_vendor(vendor3)

      vendor1.stock(item1, 35)
      vendor1.stock(item2, 7) 
      vendor2.stock(item4, 50) 
      vendor2.stock(item3, 25)
      vendor3.stock(item1, 65)

      expect(market.overstocked_items).to eq([])

    end
  end
end