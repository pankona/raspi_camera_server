class PhotosController < ApplicationController

  @@num_of_pics = 0

  def index
    p "PhotosController::index start"
    render
  end

  def exec_shoot
    p "PhotosController::exec_shoot start"
    p "exec_shoot called."
    p "Command for taking photo = #{ENV['CMD_TO_TAKE_PHOTO']}"
    system (ENV['CMD_TO_TAKE_PHOTO'])

    @@num_of_pics += 1
    p "num_of_pics = #{@@num_of_pics}"

    @num_of_pics = @@num_of_pics

    # TODO: count num of pictures
    # TODO: create array of files, used by js

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
end
