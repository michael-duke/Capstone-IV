require_relative '../app'
require 'io/console'

class Options
  def self.option_case(choice, app)
    case choice
    when 1..6
      list_all(choice, app)
    when 7..9
      create_item(choice, app)
    when 10
      app.quit_app
    else
      puts 'Incorrect choice, choose a number between 1..10'
    end
  end

  private
  def self.list_all(choice, app)
    case choice
    when 1
      print 'Not yet'
      #app.list_all_books
    when 2
      print 'Not yet'
      #app.list_all_labels
    when 3
      print 'Not yet'
      #app.list_all_music_albums
    when 4
      print 'Not yet'
      #app.list_all_genres
    when 5
      print 'Not yet'
      #app.list_all_games
    when 6
      print 'Not yet'
      #app.list_all_authors
    end

    puts 'Press Any Key to Continue...'
    $stdin.getch
    system('clear') || system('cls')
  end

  def self.create_item(choice, app)
    case choice
    when 7
      print 'Not yet'
      #app.add_book
    when 8
      print 'Not yet'
      #app.add_music_album
    when 9
      print 'Not yet'
      #app.add_game
    end

    puts 'Press Any Key to Continue...'
    $stdin.getch
    system('clear') || system('cls')
  end

end