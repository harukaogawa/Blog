class PostsController < ApplicationController
    before_action :set_target_post, only: %i[show edit update destroy]

    def index
        @posts = params[:tag_id].present? ? Tag.find(params[:tag_id]).posts : Post.all
        @posts = @posts.page(params[:page])
    end

    def new
        @post = Post.new(flash[:board])
    end
    
    def create
       # Post モデルを引数のパラメータで初期化(データの保存は指定ない)
       post = Post.new(post_params)
    
       # 保存の正否をチェック
       if post.save
          # フラッシュ
          flash[:notice] = "「#{post.title}」の記事が投稿されました!"
          redirect_to post
        else
        redirect_to new_post_path, flash: {
          post: post,
          error_messages: post.errors.full_messages
        }
       end
    end

    def show
        @comment = Comment.new(post_id: @post.id)
    end

    def edit
    end

    def update
        @post.update(post_params)

        # フラッシュ
        flash[:notice] = "「#{@post.title}」の記事を更新しました!"

        redirect_to @post
    end

    def destroy
        @post.destroy

        # フラッシュ 
        flash[:notice] = "「#{@post.title}」の記事を削除しました!"

        redirect_to posts_path
    end

    private

    def post_params
        params.require(:post).permit(:name, :title, :content, tag_ids: [])
    end

    def set_target_post
        @post = Post.find(params[:id])
    end
end