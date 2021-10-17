require './loader/price_loader'

class PriceCalc
    def self.price_hdd(params)
        hdd_price = 0
        params['hdd_type'].each do |hdd|
            hdd = hdd.split('-')
            
            hdd_price += PriceLoader.get_type_price(hdd[0]) * hdd[1].to_i
        end
        hdd_price.to_i
    end

    def self.price_cpu(params)
        PriceLoader.get_type_price('cpu') * params['cpu'].to_i
    end

    def self.price_ram(params)
        PriceLoader.get_type_price('ram') * params['ram'].to_i
    end
end