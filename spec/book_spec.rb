require_relative '../things/book'

describe Book do
  before :each do
    @book1 = Book.new('Penguin-Pub', 'good', '2022/11/15')
    @book2 = Book.new('Jacobs', 'bad', '2022/11/15')
    @book3 = Book.new('Matrix-Pub', 'good', '1990/12/15')
  end

  context 'When creating a new Book' do
    it 'should have the following attributes (publisher, cover_state and parents props)' do
      expect(@book1.publisher).to eql 'Penguin-Pub'
      expect(@book1.cover_state).to eql 'good'
      expect(@book1.id).to be_kind_of String
      expect(@book1.archived).to be_kind_of FalseClass
      expect(@book1.publish_date).to eql '2022/11/15'
    end
    it 'should be an instance of the class Book' do
      expect(@book1).to be_instance_of Book
      expect(@book2).to be_instance_of Book
    end
  end

  context 'When archiving a Book' do
    it 'can not use can_be_archived? since it\'s private' do
      expect(@book1).not_to respond_to(:can_be_archived?)
      expect(@book2).not_to respond_to(:can_be_archived?)
      expect(@book3).not_to respond_to(:can_be_archived?)
    end
    it 'can use move_to_archive method' do
      expect(@book1).to respond_to(:move_to_archive)
      expect(@book2).to respond_to(:move_to_archive)
      expect(@book3).to respond_to(:move_to_archive)
    end
    it 'should not be archived for @book1; publish_date diff < 10 and cover_state=good' do
      archived = @book1.archived
      @book1.move_to_archive
      expect(@book1.archived).to eql archived
      expect(@book2.archived).to be_falsey
    end
    it 'should not be archived for @book2 to true; cover_state is bad' do
      archived = @book2.archived
      @book2.move_to_archive
      expect(@book2.archived).not_to eql archived
      expect(@book2.archived).to be_truthy
    end
    it 'should not be archived for @book2 to true; cover_state is good but publish_date diff > 10' do
      archived = @book3.archived
      @book3.move_to_archive
      expect(@book3.archived).not_to eql archived
      expect(@book3.archived).to be_truthy
    end
  end
end
