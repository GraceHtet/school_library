require 'json'

class Storage
  def initialize(file_name)
    @file_name = file_name
  end

  def save_data(data)
    File.write(@file_name, JSON.pretty_generate(data))
    puts 'Data saved succesfully!'
  end

  def load_data
    return nil unless File.exist?(@file_name)

    file_contents = File.read(@file_name)
    return JSON.parse(file_contents) unless file_contents.empty?

    nil
  rescue JSON::ParserError
    puts "Error parsing #{@file_name}.Invalid json format!"
    nil
  end
end
