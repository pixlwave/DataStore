class DataStore

  @@file_name = "DataStore.json"
  @@directory = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, true).last

  def self.useName(name, andDirectory: directory)
    @@file_name = "#{name}.json"
    @@directory = directory
  end

  def self.useName(name)
    @@file_name = "#{name}.json"
  end

  def self.useDirectory(directory)
    @@directory = directory
  end

  def self.file_path
    File.join(@@directory, @@file_name)
  end

  def self.valueForKey(key)
    data[key]
  end

  def self.storeValue(value, forKey: key)
    update_data = data
    update_data[key] = value
    writeData(update_data)
  end

  def self.data
    if file_path && File.exist?(file_path)
      jsonData = NSData.dataWithContentsOfFile(file_path)
      NSJSONSerialization.JSONObjectWithData(jsonData, options: NSJSONReadingMutableContainers, error: nil)
    else
      {}
    end
  end

  def self.writeData(data)
    jsonData = NSJSONSerialization.dataWithJSONObject(data, options: 0, error: nil)
    NSFileManager.defaultManager.createFileAtPath(file_path, contents: jsonData, attributes: nil)
  end

end
