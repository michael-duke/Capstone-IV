require 'spec_helper'

describe MusicAlbum do
  before :each do
    @album1 = MusicAlbum.new(true, '2000/09/12')
    @album2 = MusicAlbum.new(false, '2022/11/12')
  end

  context 'test can_be_archived? method' do
    it 'should return can_be_archived? method to be true' do
      expect(@album1.can_be_archived?).to be_truthy
    end

    it 'should return can_be_archived? method to be false' do
      expect(@album2.can_be_archived?).to be_falsy
    end
  end

  context 'test move_to_archive? methos' do
    it 'should test if music has been moved to the archive or not' do
      expect(@album1.move_to_archive?).to be_truthy
    end
    it 'should test if music has been moved to the archive or not' do
      expect(@album2.move_to_archive?).to be_falsy
    end
  end
end
