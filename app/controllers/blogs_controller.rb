class BlogsController < ApplicationController

    before_action :require_log_in!, only: [:new, :edit, :show, :destroy]

    def index
        @blogs = Blog.all
    end

    def new
        @blog = Blog.new
    end


    def create
        @blog = Blog.new(blog_params)
        if @blog.save
        redirect_to new_blog_path, notice: "投稿しました！"
        else
        render 'new'
        end
    end

    def show
        @blog = Blog.find(params[:id])
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
        @blog.destroy
        redirect_to blogs_path, notice:"ブログを削除しました！"
    end

    def confirm
        @blog = Blog.new(blog_params)
    end


    private
    def blog_params
        params.require(:blog).permit(:title, :content)
    end

    def set_blog
      @blog = Blog.find(params[:id])
    end

end
