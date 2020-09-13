rides = [
    {
        driver_id: "DR0001",
        date: [
            "3rd Feb 2016",
            "3rd Feb 2016",
            "5th Feb 2016",
        ],
        cost: [
            10,
            30,
            45,
        ],
        rider_id: [
            "RD0003",
            "RD0015",
            "RD0003",
        ],
        rating: [
            3,
            4,
            2,
        ],
    },
    {
        driver_id: "DR0002",
        date: [
            "3rd Feb 2016",
            "4th Feb 2016",
            "5th Feb 2016",
        ],
        cost: [
            25,
            15,
            35,
        ],
        rider_id: [
            "RD0073",
            "RD0013",
            "RD0066",
        ],
        rating: [
            5,
            1,
            3,
        ],
    },

    {
        driver_id: "DR0003",
        date: [
            "4th Feb 2016",
            "5th Feb 2016",
        ],
        cost: [
            5,
            50,
        ],
        rider_id: [
            "RD0066",
            "RD0003",
        ],
        rating: [
            5,
            2,
        ],
    },
    {
        driver_id: "DR0004",
        date: [
            "3rd Feb 2016",
            "4th Feb 2016",
            "5th Feb 2016",
        ],
        cost: [
            5,
            10,
            20,
        ],
        rider_id: [
            "RD0022",
            "RD0022",
            "RD0073",
        ],
        rating: [
            5,
            4,
            5,
        ],
    },
]

def num_rides(ride_arr)
  return ride_arr.map {|driver| driver[:cost].length}
end

def earn_totals(ride_arr)
   return ride_arr.map {|driver| driver[:cost].sum}
end

def ave_rating(ride_arr)
  return ride_arr.map do |driver|
    driver[:rating].sum.to_f / driver[:rating].length
  end
end

def max_earners(totals_arr)
  new_arr = []
  high_earning = totals_arr.max
  totals_arr.each_with_index do |total, index|
      if total == high_earning
        new_arr << index
      end
  end
  return new_arr
end

def max_rating(ave_arr)
  new_arr = []
  high_rating = ave_arr.max
  ave_arr.each_with_index do |average, index|
      if average == high_rating
        new_arr << index
      end
  end
  return new_arr
end

def earner_string(earnings, data)
  string = ""
  earnings.each_with_index do |index_pointer, index|
    if index == 0
      string << "#{data[index_pointer][:driver_id]}"
    else
      string << "&" + "#{data[index_pointer][:driver_id]}"
  end
    return string
  end
end

def rating_string(ratings, data)
  string = ""
  ratings.each_with_index do |index_pointer, index|
    if index == 0
      string << "#{data[index_pointer][:driver_id]}"
    else
      string << "&" + "#{data[index_pointer][:driver_id]}"
    end
    return string
  end
end

def driver_print_out(ride_arr, totals, earning_arr, ave_ratings)
  string = ""
  ride_arr.length.times do |index|
    string << " Driver #{ride_arr[index][:driver_id]} completed #{totals[index]} rides and made $#{earning_arr[index]}."
    string << "\n They had an average rating of #{ave_ratings[index].round(2)}.\n\n"
  end
  return string
end

def max_earn_out(earner_string, high_earn_arr)
  string = ""
  if high_earn_arr.length == 1
    string << " The driver with the highest earnings is driver #{earner_string}.\n"
  elsif max_earn.length > 1
    string << " The drivers with the highest earning are drivers #{earner_string}\n"
  end
  return string
end

def max_rate_out(max_rate_string, high_rate_arr)
  string = ""
  if high_rate_arr.length == 1
    string << " The driver with the highest average rating is driver #{max_rate_string}.\n"
  elsif max_rate_string.length > 1
    string << " The drivers with the highest average ratings are driver #{max_rate_string}.\n"
  end
end

rides_totals = num_rides(rides)
earnings = earn_totals(rides)
averages = ave_rating(rides)

high_earners = max_earners(earnings)
high_ratings = max_rating(averages)

earn_output = earner_string(high_earners, rides)
rates_output = rating_string(high_ratings, rides)

puts driver_print_out(rides, rides_totals, earnings, averages)
puts max_earn_out(earn_output, high_earners)
puts max_rate_out(rates_output, high_ratings)
