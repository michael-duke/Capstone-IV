module Helper
  def on_spotify?(is_spotify)
    case is_spotify
    when 'y'
      true
    when 'n'
      false
    else
      puts 'Invalid Selection. Please try again!'
      exit
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
