require_relative '../lib/item'

describe Item do

  it "should return true if it is an imported item" do
    imported_item = "imported bottle of perfume"
    item = Item.new(imported_item)
    expect(item.is_imported?).to be true
  end

  it "should return false if it is not an imported item" do
    item_name = "bottle of perfume"
    item = Item.new(item_name)
    expect(item.is_imported?).to be false
  end

  it "should take the name and return true if it is an essential item" do
    item_name = "chocolate bar"
    item = Item.new(item_name)
    expect(item.is_essential?).to be true
  end

  it "should take the name and return false if it is not an essential item" do
    item_name = "bottle of perfume"
    item = Item.new(item_name)
    expect(item.is_essential?).to be false
  end
  
end
