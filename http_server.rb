require 'sinatra'

require './loader/price_loader.rb'

set :bind, '0.0.0.0'
set :port, 5678

get '/vm' do
    cpu_price = PriceLoader.get_type_price('cpu') * params['cpu'].to_i
    ram_price = PriceLoader.get_type_price('ram') * params['ram'].to_i
    hdd_price = PriceLoader.get_type_price(params['hdd_type']) * params['hdd_capacity'].to_i
    vm_price = cpu_price + ram_price + hdd_price
    vm_price.to_s
end
