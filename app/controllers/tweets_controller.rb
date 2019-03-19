class TweetsController < ApplicationController

get '/tweets' do
  if session[:user_id] != nil
    @user = User.find_by(session[:user_id])
    @tweets = Tweet.all
    erb :'/tweets/tweets'
  else
    redirect :"/login"
  end
end

get '/tweets/new' do
  @user = User.find_by(session[:user_id])
  if @user
    session[:user_id] = @user.id
    erb :'/tweets/new'
  else
    redirect :"/login"
  end
end

post '/new' do
  @user = User.find_by(session[:user_id])
  if @user
    if params[:content] != ""
      @user.tweets << Tweet.create(params)
      redirect :"/tweets/#{@user.tweets.last.id}"
    else
      redirect :'/tweets/new'
    end
  else
    redirect :"/login"
  end
end



get '/tweets/:id' do
  @user = User.find_by(session[:user_id])
  if @user
    @tweet = Tweet.find_by(params[:id])
    erb :'tweets/show_tweet'
  else
    redirect :"/login"
  end
end

get '/tweets/:id/edit' do
  binding.pry
  @user = User.find_by(session[:user_id])
  if @user
    @tweet = Tweet.find_by(params[:id])
    erb :"/tweets/edit_tweet"
  else
    redirect :"/login"
  end
end

patch "/tweets/:id" do
  @tweet = Tweet.find_by(params[:id])
  if @tweet.content == ""
    redirect :'/tweets/:id/edit'

  else
    @tweet.content = params[:content]
    @tweet.save
    redirect :"/tweets/#{@tweet.id}"

  end
end

post 'tweets/:id/delete' do
  @user = User.find_by(session[:user_id])
  if @user
    @tweet = Tweet.find_by(params[:id])
    @tweet.delete
    redirect "/tweets/tweets"
  else redirect :"/login"
  end
end

end
