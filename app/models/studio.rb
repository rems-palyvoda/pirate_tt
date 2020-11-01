class Studio
  class << self
    def all
      DataLoader.data.map { |attrs| self.new(*attrs.values) }
    end

    def where(id:)
      DataLoader.data.select { |data| data[:studioId] == id }
    end

    def total_time
      total = 0
      
      DataLoader.data.each do |attrs|
        total += Studio.new(*attrs.values).booked_hours
      end 

      total
    end
  end

  attr_reader :id, :starts_at, :ends_at

  def initialize(id, starts_at, ends_at)
    @id = id
    @starts_at = parse_date starts_at
    @ends_at = parse_date ends_at
  end

  def booked_hours
    (ends_at.to_i - starts_at.to_i) / 3600
  end

  def to_json
    {
      id: id,
      starts_at: starts_at,
      ends_at: ends_at
    }
  end

  private

  def parse_date(date_time)
    return date_time if date_time.is_a? DateTime
    DateTime.parse date_time
  end
end
