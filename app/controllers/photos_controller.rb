class PhotosController < ApplicationController
  def index
    render
  end

  def exec_shoot
    p "exec_shoot called."
    render 'index'
  end

  def serve
    # path = [:params]     
    #
    send_file(
      path
      :disposition => 'inline',
      :type => 'image/jpeg',
      :x_sendfile => true)
  end
end
