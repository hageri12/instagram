class BlogsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_blog, only:[:edit, :update, :destroy]

  def index
    @blogs = Blog.all
    @slot = Slot.new
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.create(blogs_params)
    @blog.user_id = current_user.id
    if @blog.save
      redirect_to blogs_path,notice: "投稿できました！"
      NoticeMailer.sendmail_blog(@blog).deliver
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @blog.update(blogs_params)
      redirect_to blogs_path,notice: "編集できました！"
    else
      render 'edit'
    end
  end

 def destroy
   @blog.destroy
   redirect_to blogs_path, notice: "削除できました！"
 end

def slot
end


  private
  def blogs_params
    params.require(:blog).permit(:content,:image)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end
