class TweetsController < ApplicationController
  before_action :authenticate_user! # 5-1追加

  def index
#書き換える部分ここから
  if params[:search] == nil
    @tweets= Tweet.all
  elsif params[:search] == ''
    @tweets= Tweet.all
  else
    #部分検索
    @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%')
end
#ここまで
  end
  # 3-8追加場所ここから
  def new
    @tweet = Tweet.new
  end
# ここまで
 #3-9追加箇所
 def create
  tweet = Tweet.new(tweet_params)
  tweet.user_id = current_user.id  #5-2追記

  if tweet.save
    redirect_to :action => "index"
  else
    redirect_to :action => "new"
  end
end
# 3-13追記ここから
def show
  @tweet = Tweet.find(params[:id])
  
end
# ここまで
  # 3-14追記ここから
  def edit
    @tweet = Tweet.find(params[:id])
  end
  # ここまで
  # 3-14(2)追記ここから
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end
  # ここまで
  # 3-15追加ここから
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end
  # ここまで
private
def tweet_params
  params.require(:tweet).permit(:body)
end
#ここまで
end
