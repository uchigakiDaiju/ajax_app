class PostsController < ApplicationController
  def index #indexアクションを定義した
    @posts = Post.all.order(id: "DESC")  # 全てのレコードを@postsに代入
  end

  # def new
  # end

  def create
    Post.create(content: params[:content])
    redirect_to action: :index 
  end

  def checked
    post = Post.find(params[:id])
    if post.checked  # checkedはカラムで、boolean型。この場合、trueで黒くなっている
      post.update(checked: false) #checked: falseは、白くする
    else
      post.update(checked: true) #checked: trueは黒くする
    end

    item = Post.find(params[:id])
    render json: {post: item}

  end
end
