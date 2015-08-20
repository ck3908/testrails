module PageHelper
  def calendar (month, year)

    current_date = Date.new(year,month,1)
    prev_month = month - 1
    prev_year = year
    if (prev_month <= 0)
      prev_month = 12
      prev_year = year - 1
    end

    next_month = month+1
    next_year = year
    if (next_month == 13)
      next_month = 1
      next_year = year + 1
    end

    # "/page/calendar?month=#{prev_month}&year=#{prev_year}"
    # "/page/calendar?month=#{next_month}&year=#{next_year}"
    cal =''
    cal += link_to "Prev", calendar_path(:month=> prev_month, :year=> prev_year)
    cal += '  '
    cal += link_to "Next", calendar_path(:month=> next_month, :year=> next_year)
    cal += "<br/>"+current_date.strftime("%B")

    day_of_week = current_date.strftime("%w").to_i
    cal += "<table border='1'>\n\t<tr>\n"
    days = %w(Sun Mon Tue Wed Thu Fri Sat)
    days.each do |day|
      cal += "\t\t<td>#{day}</td>\n"
    end
    # second row - first week of the month
    cal +="<tr>"
    day_of_week.times do |day|
      cal += "<td>&nbsp;</td>"
    end
    # print the days of week starting with 1

    (7-day_of_week).times do |day|
      cal += "<td>#{day+1}</td>"
    end
    cal += "<tr>"
    # find out number of days of month and print rows up to it
    last_date_month = Date.civil(year,month,-1)
    num_days = last_date_month.strftime("%-d").to_i
    next_day = 7 - day_of_week + 1
    count7 = 0
    (7-day_of_week).upto(num_days-1)do
      cal += "<td>#{next_day}</td>"
      next_day += 1
      count7 += 1
      if(count7%7==0)
        cal += "<tr>"
      end
    end

    cal +="<tr>"
    cal += "\t</tr></table>\n"
    cal += "Month: #{month}<br/>Year: #{year}<br/>"
    cal += "Date: #{current_date}<br/>"
    cal += "number of day in month:#{Date.civil(year,month,-1)}"
    return cal
  end
end