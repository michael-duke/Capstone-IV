require 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
    @item = Item.new('1999/10/23')
  end

  it 'should test that Genre name is Comedy' do
    expect(@genre.name).to eq('Comedy')
  end

  it 'should add Item to Genre and test if item is in genre' do
    @genre.add_item(@item)
    expect(@genre.items[0]).to be(@item)
  end

  it 'should add Item to Genre and test if the genre belongs to the item' do
    @item.genre = (@genre)
    expect(@genre.items[0]).to be(@item)
  end
end
