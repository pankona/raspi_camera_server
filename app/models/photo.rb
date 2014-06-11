
class Photo
  def self.get_photos
    Dir.chdir(ENV['PHOTO_DIR'])
    Dir.glob("*.{jpg,jpeg}")
  end

  def self.take_photo
    system ("wget -O /tmp/#{ENV['PHOTO_BASENAME']}.jpg http://#{local_ip}:8080/?action=snapshot")
    system ("mv /tmp/#{ENV['PHOTO_BASENAME']}.jpg /tmp/#{ENV['PHOTO_BASENAME']}#{self.num_of_photos}.jpg")
  end

  def self.num_of_photos
    get_photos.length 
  end

  def self.get_fullpath_from_photo_name(photo_name)
    "#{ENV['PHOTO_DIR']}/#{photo_name}"
  end

  def self.local_ip
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
    UDPSocket.open do |s|
      s.connect '64.233.187.99', 1
      s.addr.last
    end
    ensure
      Socket.do_not_reverse_lookup = orig
  end
end
