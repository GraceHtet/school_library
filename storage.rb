require 'json'

class Storage
  def store_data(data, arr, path)
    arr.push(data)
    json = JSON.generate(arr)
    File.write(path, json)
  end

  def load_data(path)
    file_data = File.read(path)
    datas = JSON.parse(file_data, { symbolize_names: true }) unless file_data == ''
    datas
  end
end
