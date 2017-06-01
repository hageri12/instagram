class SlotController < ApplicationController
  def index
    @slot = Blog.find(params[:id])
  end
end
