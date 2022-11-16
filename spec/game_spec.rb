require_relative '../things/game'

describe Game do
  before :each do
    @fight_night = Game.new('2021/1/20', '2022/11/16', multiplayer: true)
    @citrix = Game.new('1997/1/1', '2008/12/31')
    @mortal_combat_one = Game.new('1989/2/20', '2022/11/17')
    @author = Author.new('John', 'Doe')
  end

  context 'Testing the Game Class' do
    it 'should create a new game when Game class is instantiated' do
      expect(@fight_night.last_played_at).to eq '2022/11/16'
      expect(@fight_night.multiplayer).to eq true
      expect(@citrix.multiplayer).to eq false
    end

    it 'Test instance of Game Class' do
      expect(@fight_night.last_played_at).to eq '2022/11/16'
      expect(@author).not_to be_instance_of Game
      expect(@citrix).to be_instance_of Game
    end
  end

  context 'archived Method Test' do
    it 'archiving not possible - Private method' do
      expect(@fight_night).not_to respond_to(:can_be_archived?)
      expect(@citrix).not_to respond_to(:can_be_archived?)
    end

    it 'Move to archived super method' do
      expect(@fight_night).to respond_to(:move_to_archive)
      expect(@citrix).to respond_to(:move_to_archive)
    end

    it 'Last_played greater than 2years shoudld be _archived_ = return True ' do
      @fight_night.move_to_archive
      @citrix.move_to_archive
      expect(@fight_night.archived).to be false
      expect(@citrix.archived).to be true
    end

    it 'Last_played less than 2years although published date is greater than 10 yrs shoudld be _not_be_archived_ ' do
      @mortal_combat_1.move_to_archive
      expect(@mortal_combat_one.archived).to be false
    end
  end
end
