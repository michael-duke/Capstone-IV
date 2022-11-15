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
      puts 'app.list_all_music_albums'
      # app.list_all_music_albums
    when 4
      puts '# app.list_all_genres'
      # app.list_all_genres
    when 5
      puts '# app.list_all_games'
      # app.list_all_games
    when 6
      puts '# app.list_all_authors'
      # app.list_all_authors
    end
    clear_console
  end

  def self.create_item(choice, app)
    case choice
    when 7
      app.add_book
    when 8
      puts '# app.add_music_album'
      # app.add_music_album
    when 9
      puts '# app.add_game'
      # app.add_game
    end
    clear_console
  end

  def self.clear_console
    puts "\nPress any key to Continue..."
    $stdin.getch
    system('clear') || system('cls')
  end
end
