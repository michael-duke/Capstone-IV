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

  def self.list_all(choice, app)
    case choice
    when 1
      app.list_all_books
    when 2
      app.list_all_labels
    when 3
      app.list_all_music_albums
    when 4
      app.list_all_genres
    when 5
      app.list_all_games
    when 6
      app.list_all_authors
    end
    clear_console
  end

  def self.create_item(choice, app)
    case choice
    when 7
      app.add_book
    when 8
      app.add_music_album
    when 9
      app.add_game
    end
    clear_console
  end

  def self.clear_console
    puts "\nPress any key to Continue..."
    $stdin.getch
    system('clear') || system('cls')
  end
end
