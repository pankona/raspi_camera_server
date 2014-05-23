class PhotosController < ApplicationController

  @@pics

  def index
    p "PhotosController::index start"
    Dir.chdir(ENV['PHOTO_DIR'])
    @@pics = Dir.glob("*.{jpg,jpeg}")
    
    @pics = @@pics

    @my_ip_address = local_ip

    photo = Photo.new
    photo.hello

    render
  end

  def exec_shoot
    p "PhotosController::exec_shoot start"
    p "exec_shoot called."
    p "Command for taking photo = #{ENV['CMD_TO_TAKE_PHOTO']}"
    system (ENV['CMD_TO_TAKE_PHOTO'])

    Dir.chdir(ENV['PHOTO_DIR'])
    @@pics = Dir.glob("*.{jpg,jpeg}")
    system ("mv /tmp/pic.jpg /tmp/pic#{@@pics.length + 1}.jpg")

    @@pics = Dir.glob("*.{jpg,jpeg}")
    @pics = @@pics

    render 'index'
  end

  def serve
    p "PhotosController::serve start"
    path = "#{ENV['PHOTO_DIR']}/#{params[:file_path]}.#{params[:format]}"
    p "file_path = #{path}"

    send_file(
      path,
      :disposition => 'inline',
      :type => 'image/jpeg',
      :x_sendfile => true)
  end

  def local_ip
    orig, Socket.do_not_reverse_lookup = Socket.do_not_reverse_lookup, true
    UDPSocket.open do |s|
      s.connect '64.233.187.99', 1
      s.addr.last
    end
    ensure
      Socket.do_not_reverse_lookup = orig
  end

end
