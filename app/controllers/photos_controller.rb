
class PhotosController < ApplicationController
  def index
    p "PhotosController::index start"
    @my_ip_address = Photo.local_ip
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
end
