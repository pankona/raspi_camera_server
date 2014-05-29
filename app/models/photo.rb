
class Photo

  def self.get_photos
    Dir.chdir(ENV['PHOTO_DIR'])
    Dir.glob("*.{jpg,jpeg}")
  end

  def self.take_photo
    p "Command for taking photo = #{ENV['CMD_TO_TAKE_PHOTO']}"
    system (ENV['CMD_TO_TAKE_PHOTO'])
    system ("mv /tmp/#{ENV['PHOTO_BASENAME']}.jpg /tmp/#{ENV['PHOTO_BASENAME']}#{self.num_of_photos}.jpg")
  end

  def self.num_of_photos
    get_photos.length 
  end

  def self.get_fullpath_from_photo_name(photo_name)
    "#{ENV['PHOTO_DIR']}/#{photo_name}"
  end
end
