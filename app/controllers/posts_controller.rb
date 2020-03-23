class PostsController < ApplicationController
  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
  end

  # 修正
  def create
      post = Post.create(post_params)

      # リダイレクト処理追加
      redirect_to post
  end

  def show
      @post = Post.find(params[:id])
  end

  def edit
      @post = Post.find(params[:id])
  end

  def update
      post = Post.find(params[:id])
      post.update(post_params)
      redirect_to post
  end

  # 削除機能
  def destroy
      post = Post.find(params[:id])
      post.delete

      # 投稿一覧へリダイレクト
      redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:name, :title, :content)
  end
end