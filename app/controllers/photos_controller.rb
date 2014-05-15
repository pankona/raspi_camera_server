class PhotosController < ApplicationController
  def index
    render
  end

  def exec_shoot
    p "exec_shoot called."
    render 'index'
  end
end
