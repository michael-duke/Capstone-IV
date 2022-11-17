class MenuDisplay
  attr_reader :options

  def initialize
    @options = [
      '1 - List all books',
      '2 - List all labels',
      '3 - List all music albums',
      '4 - List all genres',
      '5 - List all games',
      '6 - List all authors',
      '7 - Add a book',
      '8 - Add a music album',
      '9 - Add a game',
      '10 - Exit the App'
    ]
  end

  def menu
    puts '
    _________      _____       ______
    __  ____/_____ __  /______ ___  /____________ _
    _  /    _  __ `/  __/  __ `/_  /_  __ \_  __ `/
    / /___  / /_/ // /_ / /_/ /_  / / /_/ /  /_/ /
    \____/  \__,_/ \__/ \__,_/ /_/  \____/_\__, /
                                          /____/
    '
    puts "\nPlease choose an option by entering a number:"

    puts @options
  end
end
