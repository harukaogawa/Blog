class PostsController < ApplicationController
  # 各アクションが呼び出される前に実行する(%iは、シンボルの配列を作成)
  before_action :set_target_post, only: %i[show edit update destroy]

  def index
      @posts = Post.all
  end

  def new
      @post = Post.new
  end

  def create
      post = Post.create(post_params)

      redirect_to post
  end

  def show
  end

  def edit
  end

  def update
      @post.update(post_params)
      redirect_to @post
  end

  def destroy
      @post.delete
      redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:name, :title, :content)
  end

  # アクションが呼び出される前に実行したい処理を記述
  def set_target_post
      @post = Post.find(params[:id])
  end
end