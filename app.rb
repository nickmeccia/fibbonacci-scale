$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'sinatra'
require 'fibbaaah'

get '/' do
  erb :form
end

get '/fibbaaah' do
  @nums = Fibbaaah.many_fibs_with_offset_from \
    starts: (-5..14),
    offset: params[:size].to_i,
    buffer: params[:buffer].to_i

  @num_to_show = 5

  erb :result
end
