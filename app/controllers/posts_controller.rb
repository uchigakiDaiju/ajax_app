class PostsController < ApplicationController
  def index #indexアクションを定義した
    @posts = Post.all.order(id: "DESC")  # 全てのレコードを@postsに代入
  end

  # def new
  # end

  def create
    # Post.create(content: params[:content])
    # redirect_to action: :index 
    post = Post.create(content: params[:content], checked: false)
    render json:{ post: post} #メモ投稿機能のサーバーサイドの記述は完了
  end

  def checked
    # binding.pry #ここまで来ていたので、
    post = Post.find(params[:id])
    if post.checked  # checkedはカラムでboolean型。この場合、trueで黒くなっている
      post.update(checked: false) #checked: falseは、白くする
    else
      post.update(checked: true) #checked: trueは黒くする
    end

    item = Post.find(params[:id])
    render json: {post: item}

  end
end
