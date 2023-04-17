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
        require 'pry'; binding.pry
      end
    end
    all_items.values.each do |keys, values|
    end
  end



end