require_relative '../properties/author'
require_relative '../things/game'

describe Author do
  before :each do
    @ubisoft_ent = Author.new('Ubisoft', 'Ent')
    @ea_sport = Author.new('EA', 'SPORT')
    @fifa2023 = Game.new('2021/1/20', '2022/11/16', multiplayer: true)
    @fight_night = Game.new('2021/12/05', '2022/11/10', multiplayer: true)
  end

  context 'Adding a New Author' do
    it 'should create a new Author when Game class is instantiated' do
      expect(@ubisoft_ent).to be_instance_of Author
      expect(@ea_sport).to be_instance_of Author
      expect(@ubisoft_ent.first_name).to eq 'Ubisoft'
      expect(@ea_sport.last_name).to eq 'SPORT'
    end

    it 'Names should be classof String' do
      expect(@ubisoft_ent.first_name).to be_kind_of String
      expect(@ubisoft_ent.last_name).to be_kind_of String
    end
  end

  context 'Running the #add_item Class method' do
    it 'can use #add_item method' do
      expect(@ea_sport).to respond_to(:add_item)
    end
    it 'adding an item' do
      expect(@ea_sport.items.count).to eq 0
      @ea_sport.add_item(@fifa2023)
      @ubisoft_ent.add_item(@fight_night)
      expect(@ubisoft_ent.items.count).to eq 1
      expect(@ea_sport.items.count).to eq 1
    end
  end
end
