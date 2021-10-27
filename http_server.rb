require 'sinatra'

require './price_calc.rb'

set :bind, '0.0.0.0'
set :port, 5678

get '/vm' do
    cpu_price = PriceCalc.price_cpu(params)
    ram_price = PriceCalc.price_ram(params)
    hdd_price = PriceCalc.price_hdd(params)
    add_hdd_price = PriceCalc.price_add_hdd(params)

    vm_price = cpu_price + ram_price + hdd_price + add_hdd_price
    vm_price.to_s
end
