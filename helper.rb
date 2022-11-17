module Helper
  def on_spotify?
    print 'Is the Music Album on Spotify? [Y/N]: '
    is_spotify = gets.chomp.downcase
    case is_spotify
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid Selection. Please enter \'y\', \'Y\' or \'n\', \'N\'!'
      on_spotify?
    end
  end

  def multiplayer?
    print 'Is it a Multiplayer Game? [Y/N]:'
    multiplayer = gets.chomp.downcase

    case multiplayer
    when 'n'
      false
    when 'y'
      true
    else
      puts 'Incorrect choice, kindly enter \'y\', \'Y\' or \'n\', \'N\' 😀'
      multiplayer?
    end
  end
end
