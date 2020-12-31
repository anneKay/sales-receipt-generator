require_relative '../lib/item'

describe Item do
  before do
      @item = Item.new()
  end

  it "should return true if it is an imported item" do
    imported_item = "imported bottle of perfume"
    expect(@item.is_imported?(imported_item)).to be true
  end

  it "should return false if it is not an imported item" do
    item_name = "bottle of perfume"
    expect(@item.is_imported?(item_name)).to be false
  end

  it "should take the name and return true if it is an essential item" do
    item_name = "chocolate bar"
    expect(@item.is_essential?(item_name)).to be true
  end

  it "should take the name and return false if it is not an essential item" do
    item_name = "bottle of perfume"
    expect(@item.is_essential?(item_name)).to be false
  end
  
end
