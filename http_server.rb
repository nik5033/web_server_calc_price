require 'sinatra'

require './loader/price_loader.rb'

set :bind, '0.0.0.0'
set :port, 5678

get '/vm' do
    cpu_price = PriceLoader.get_type_price('cpu') * params['cpu'].to_i
    ram_price = PriceLoader.get_type_price('ram') * params['ram'].to_i
    hdd_price = 0

    params['hdd_type'].each do |hdd|
        hdd = hdd.split('-')
        hdd_price += PriceLoader.get_type_price(hdd[0]) * hdd[1].to_i
    end

    vm_price = cpu_price + ram_price + hdd_price
    vm_price.to_s
end
