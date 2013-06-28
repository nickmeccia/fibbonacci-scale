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

__END__
@@form
<form action="/fibbaaah" method="get" accept-charset="utf-8">

  <label for="size">size</label>
  <input type="text" name="size" value="16" id="size">

  <label for="buffer">buffer</label>
  <input type="text" name="buffer" value="0" id="buffer">

  <p><input type="submit" value="Continue &rarr;"></p>
</form>




@@result
<% @nums.each do |fib_nums| %>
  <div>
    <% fib_nums.take(@num_to_show).reverse.each.with_index(1) do |fib, index| %>
      <h<%= index %> style="font-size: <%= fib %>">Header (<%= fib %>)</h1>
    <% end %>
  </div>
<% end %>
