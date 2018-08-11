class BlogsController < ApplicationController

    before_action :require_log_in!, only: [:new, :edit, :show, :destroy]

    def index
        @blogs = Blog.all
    end

    def new
      if params[:back]
      @blog = Blog.new(blog_params)
      else
      @blog = Blog.new
      end
    end


    def create
        @blog = Blog.new(blog_params)
        @blog.user_id = current_user.id

        if @blog.save
        BlogMailer.blog_mail(@blog).deliver
        redirect_to new_blog_path, notice: "投稿しました！"
        else
        render 'new'
        end
    end

    def show
      @blog = Blog.find_by(id: params[:id])
      @favorite = current_user.favorites.find_by(blog_id: @blog.id)
    end


    def edit
        @blog = Blog.find(params[:id])
    end

    def update
    @blog = Blog.find(params[:id])
        if @blog.update(blog_params)
        redirect_to blogs_path, notice: "ブログを編集しました！"
        else
        render 'edit'
        end
    end

    def destroy
      @blog = Blog.find_by(id: params[:id])
        @blog.destroy
        redirect_to blogs_path, notice:"ブログを削除しました！"
    end

    def confirm
      @blog = Blog.new(blog_params)
      render :new if @blog.invalid?
    end

    private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end


end
