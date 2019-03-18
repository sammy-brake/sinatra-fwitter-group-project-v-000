class TweetsController < ApplicationController

get '/tweets' do
  binding.pry
  @user = User.find(session[:user_id])
    erb :'tweets/tweets'
end
#
# get '/tweets/:id' do
#   @tweet = Tweet.find(params[:id])
#   erb :'tweets/show_tweet'
# end

### just writing out future routes
# get '/tweets/:id/edit' do
# end

# post '/tweets/edit' do
#end

# post 'tweets/:id/delete' do
# end

end
