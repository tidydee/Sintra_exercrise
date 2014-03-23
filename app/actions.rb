# Homepage (Root path)
get '/' do
  erb :index
end

get '/messages' do
  @messages = Message.all
  erb :'messages/index'
end

get '/messages/new' do
  @message = Message.new
  erb :'messages/new'
end

post '/messages' do
  # binding.pry
  @message = Message.new(
    # title: params[:title],
    content: params[:content],
    author:  params[:author],
    url: params[:url]
  )
  if @message.save
    redirect '/messages'
  else
    erb :'messages/new'
  end
end

get '/messages/:id' do
  @message = Message.find params[:id]
  erb :'messages/show'
end

def uri?(string)
  uri = URI.parse(string)
  %w( http https ).include?(uri.scheme)
rescue URI::BadURIError
  false
rescue URI::InvalidURIError
  false
end