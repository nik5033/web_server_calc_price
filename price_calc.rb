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

    def self.price_add_hdd(params)
        hdd_price = 0

        if params['add_hdd_type'] && params['add_hdd_capacity']
            add_disk = Hash[params['add_hdd_type'].zip(params['add_hdd_capacity'])]
            
            add_disk.each do |hdd_type, hdd_capacity|
                hdd_price += PriceLoader.get_type_price(hdd_type) * hdd_capacity.to_i
            end
        end

        hdd_price
    end
end