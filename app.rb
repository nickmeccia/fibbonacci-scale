$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'sinatra'
require 'fibbaaah'

get '/' do
  erb :form
end

get '/fibbaaah' do
  @nums = Fibbaaah.many_fibs_with_offset_from starts: (-5..14), offset: params[:size].to_i
  erb :result
end

__END__
@@form
<form action="/fibbaaah" method="get" accept-charset="utf-8">
  <label for="size">size</label><input type="text" name="size" value="" id="size">
  <p><input type="submit" value="Continue &rarr;"></p>
</form>

@@result
<% @nums.each do |fib_nums| %>
  <% s4, s3, s2, s1 = fib_nums.take(4) %>
  <div>
    <h1 style="font-size: <%= s1 %>">Header</h1>
    <h2 style="font-size: <%= s2 %>">Header</h1>
    <h3 style="font-size: <%= s3 %>">Header</h1>
    <h4 style="font-size: <%= s4 %>">Header</h1>
  </div>
<% end %>
