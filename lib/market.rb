class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors.find_all do |vendor|
      vendor.inventory.include?(item)
    end
  end

  def sorted_item_list
    items_name = []
    vendors.map do |vendor|
      vendor.inventory.each do |keys, values|
        items_name << keys.name
      end
    end
    items_name.uniq.sort
  end

  def total_inventory
    all_items = Hash.new
    vendors.map do |vendor|
      vendor.inventory.each do |keys, values|
        all_items[keys] = Hash.new
        all_items[keys][:quantity] = values
        all_items[keys][:vendors] = vendors_that_sell(keys)
      end
    end
    all_items
  end
  
  def overstocked_items
    overstock = []
    total_inventory.map do |items|
      items.each do |keys, values|
        keys
        require 'pry'; binding.pry
      end
    end
  end
end



