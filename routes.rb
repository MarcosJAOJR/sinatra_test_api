require 'sinatra'

before do
  content_type :json
end

configure do
  set :show_exceptions, false
end

post '/orders/:kind' do
  @orders_kinds = ["buy", "sell"]
  if !@orders_kinds.include?(params[:kind])
    halt 500, {:message => "'#{params[:kind]}' is a invalid kind of order, you only could creat these kinds: #{@orders_kinds.join(", ")}"}.to_json
  end
end

error do
  halt 500, "Something get wrong."
end
