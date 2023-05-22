require_relative 'menu'
require_relative 'app'



def main
  app = Option.new
  menu = Menu.new(app)
  menu.menu_list
end

print "Welcome to school library app!!! \n"

main
