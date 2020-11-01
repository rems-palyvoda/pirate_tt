class StudioBookingTime
  def self.call
    total_time = Studio.total_time

    studios_total_hours = 
      Studio.all.each_with_object({}) do |studio, storage|
        if storage[studio.id]
          storage[studio.id] += studio.booked_hours
        else
          storage[studio.id] = studio.booked_hours
        end
      end

    result = {}

    studios_total_hours.each do |id, hours|
      result[id] = hours.to_f / total_time.to_f * 100  
    end

    result
  end
end