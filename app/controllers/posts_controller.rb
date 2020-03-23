class PostsController < ApplicationController
  def index
      # 投稿データを全て取得、またインスタンス変数なのでViewで参照可能
      @posts = Post.all
  end

  def new
      # Postモデルのオブジェクトを作成
      # @boardはインスタンス変数で、Viewで参照可能
      @post = Post.new
  end

  def create
      # データはparamsという変数に渡されてくる
      # create は、Postモデルのクラスメソッド
      Post.create(post_params)
      binding.pry
  end

  private

  # paramsから欲しいデータのみ抽出
  def post_params
      params.require(:post).permit(:name, :title, :content)
  end
end