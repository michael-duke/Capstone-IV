require_relative './app'
require_relative './console-ui/prompt_user'

def main
  puts "\n👋 Welcome to Catalog of my Things App!"
  app = App.new
  PromptUser.prompt_user(app)
end

main
