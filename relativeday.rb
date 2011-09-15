require 'Time'

class RelativeDay
	def self.getDate(day, *args)
		time = Time.new
		wday = getDayNumeric(day)

		hour, minute, second = 0, 0, 0

		if args.count > 0
			params = args[0]
			if params.is_a? Hash
				#can pass in custom time, set hour + min if custom time passed in
				#, 
				#, 
				time = params[:time] if params[:time] and params[:time].is_a? Time
				hour, minute, second = time.hour, time.min, time.sec if params[:time]

				#relative.. if current time.wday = 3 and requested day is 1 will get next week (8)
				#exlusive.. if current time.wday = 3 and requested day is 3 will get next week (10)
				wday += 7 if params[:relative] and time.wday > wday or (params[:exclusive] and time.wday >= wday)

				hour = params[:hour] if params[:hour]
				minute = params[:minute] if params[:minute]
				sec = params[:second] if params[:second]
			end
		end

		#align day
		theDay = Time.at(time.to_i + ((wday - time.wday) * (60*60*24)))

		#align hours and minutes
		theDay = Time.local(theDay.year, theDay.month, theDay.day, hour, minute, second)

		theDay
	end

	def self.getDayNumeric(day)
		case day
			when :sunday
				0
			when :monday
				1
			when :tuesday
				2
			when :wednesday
				3
			when :thursday
				4
			when :friday
				5
			when :saturday
				6
		end
	end
end