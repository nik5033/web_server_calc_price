require './loader/price_loader'

class PriceCalc
    def self.price_hdd(params)
        PriceLoader.get_type_price(params['hdd_type']) * params['hdd_capacity'].to_i
    end

    def self.price_cpu(params)
        PriceLoader.get_type_price('cpu') * params['cpu'].to_i
    end

    def self.price_ram(params)
        PriceLoader.get_type_price('ram') * params['ram'].to_i
    end
end