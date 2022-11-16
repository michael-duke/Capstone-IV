require_relative 'spec_helper'

describe MusicAlbum do
  before :each do
    @music1 = MusicAlbum.new(true, '2021/01/10')
    @music2 = MusicAlbum.new(false, '2021/01/10')
    @music3 = MusicAlbum.new(true, '1990/12/15')
  end

  context 'When creating a new MusicAlbum' do
    it 'should have the following attributes (on_spotify, parents props)' do
      expect(@music1.on_spotify).to be_truthy
      expect(@music1.id).to be_kind_of String
      expect(@music1.archived).to be_kind_of FalseClass
      expect(@music1.publish_date).to eql '2021/01/10'
    end
    it 'should be an instance of the class MusicAlbum' do
      expect(@music1).to be_instance_of MusicAlbum
      expect(@music2).to be_instance_of MusicAlbum
    end
  end

  context 'When archiving a MusicAlbum' do
    it 'can use move_to_archive method' do
      expect(@music1).to respond_to(:move_to_archive)
      expect(@music2).to respond_to(:move_to_archive)
      expect(@music3).to respond_to(:move_to_archive)
    end
    it 'should not be archived for @music1; publish_date diff < 10' do
      archived = @music1.archived
      @music1.move_to_archive
      expect(@music1.archived).to eql archived
      expect(@music2.archived).to be_falsey
    end
    it 'should not be archived for @music2 to false; publish_date diff < 10 and on_spotify is false' do
      archived = @music2.archived
      @music2.move_to_archive
      expect(@music2.archived).to eql archived
      expect(@music2.archived).to be_falsey
    end
    it 'should not be archived for @music2 to true; on_spotify is true and publish_date diff > 10' do
      archived = @music3.archived
      @music3.move_to_archive
      expect(@music3.archived).not_to eql archived
      expect(@music3.archived).to be_truthy
    end
  end
end
