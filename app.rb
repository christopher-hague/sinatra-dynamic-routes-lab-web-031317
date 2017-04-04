require_relative 'config/environment'

class App < Sinatra::Base

  get '/reversename/:name' do
    @name = params[:name]
    "#{@name.reverse}"
  end

  get '/square/:number' do
    @num = params[:number]
    "#{@num.to_i * @num.to_i}"
  end

  get '/say/:number/:phrase' do
    @num = params[:number]
    @phrase = params[:phrase]
    "#{@phrase}\n" * @num.to_i
  end

  get '/say/:word1/:word2/:word3/:word4/:word5' do
    @words = [params[:word1], params[:word2], params[:word3], params[:word4], params[:word5]]
    @words.join(" ") + "."
  end

  get '/:operation/:number1/:number2' do
    @operation = params[:operation]
    @num1 = params[:number1].to_i
    @num2 = params[:number2].to_i
    operations = { "add" => "+", "subtract" => "-", "multiply" => "*", "divide" => "/" }

    "#{@num1.send(operations[@operation], @num2)}"
  end

end
