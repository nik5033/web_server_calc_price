require 'csv'

require './entities/price.rb'
require './loader/loader.rb'

class PriceLoader < Loader
    def self.get_type_price(type)
        load_data
        @@data.find { |price| price.type == type }.price.to_i

    end
    
    private

    def self.csv_load
        file = './csv/prices.csv'
        @@data = Array.new

        CSV.foreach(file) do |row|
          @@data.append(Price.new(*row_preprocess(row)))
        end
    end

    def self.row_preprocess(row)
        row[1] = row[1].to_i
        row
    end
end