class Loader

    protected

    def self.load_data
        csv_load    
    end

    def self.csv_load
        raise NotImpementedError
    end

    def self.row_preprocess(row)
        raise NotImpementedError
    end
end