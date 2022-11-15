require_relative '../properties/label'

describe Label do
  before :each do
    @label = Label.new('The Songs of Achilles', 'amber')
    @book1 = Book.new('Penguin-Pub', 'good', '2022/11/15')
    @book2 = Book.new('Matrix-Pub', 'good', '1990/12/15')
  end

  context 'When creating a new Label' do
    it 'should have the following attributes (title, color and id)' do
      expect(@label.title).to eql 'The Songs of Achilles'
      expect(@label.color).to eql 'amber'
      expect(@label.id).to be_kind_of String
    end
    it 'should be an instance of the class Label' do
      expect(@label).to be_instance_of Label
    end
  end

  context 'When using #add_item method, (adding book to a label)' do
    it 'can use #add_item method' do
      expect(@label).to respond_to(:add_item)
    end
    it 'can add an item, items array length increases' do
      expect(@label.items.count).to eq 0
      @label.add_item(@book1)
      @label.add_item(@book2)
      expect(@label.items.count).to eq 2
    end
  end
end
