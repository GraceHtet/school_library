require_relative 'menu'

MENU = Menu.new

def main
  num = MENU.select_option
  return puts "Thanks for using this app \n" if num == 7

  MENU.choices(num)
  main
end

print "Welcome to school library app!!! \n"

main
