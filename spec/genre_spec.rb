require 'spec_helper'

describe Genre do
  before :each do
    @genre = Genre.new('Comedy')
    @music = MusicAlbum.new(true, '1990/12/15')
  end

  it 'should test that Genre name is Comedy' do
    expect(@genre.name).to eq('Comedy')
  end

  it 'should add Item to Genre and test if item is in genre' do
    @genre.add_item(@music)
    expect(@genre.items[0]).to be(@music)
  end

  it 'should add Item to Genre and test if the genre belongs to the item' do
    @music.genre = (@genre)
    expect(@music.genre).to be_instance_of(Genre)
  end
end
