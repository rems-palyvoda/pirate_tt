class DataLoader
  class << self
    def set_custom_data(array_of_attributes:)
      @data = array_of_attributes
    end

    def data
      @data ||= load
    end

    def load
      JSON(
        File.read(Rails.root.join('db', 'data.json')),
        symbolize_names: true
      )
    end
  end
end
