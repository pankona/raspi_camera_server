class PhotosController < ApplicationController

  def index
    p "PhotosController::index start"
    @my_ip_address = local_ip
    @pics = Photo.get_photos
    render
  end

  def exec_shoot
    p "PhotosController::exec_shoot start"
    Photo.take_photo
    @pics = Photo.get_photos
    render 'index'
  end

  def serve
    p "PhotosController::serve start"
    photo_name = "#{params[:file_path]}.#{params[:format]}"
    path = Photo.get_fullpath_from_photo_name(photo_name)

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
