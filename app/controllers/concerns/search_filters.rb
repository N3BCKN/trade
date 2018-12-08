module SearchFilters
	extend ActiveSupport::Concern

	included do
		:translateFilters
	end

	def translateFilters(filters)
	@filterQueries = Array.new
	@tempCountries = Array.new
	

	if !filters[:date].nil?
		@filterQueries.push({range: 
			{ created_at: {
				gte: "now-#{filters[:date]}d/d",
				lte: "now/d"
		}}}) 
	end

	if !filters[:continents].nil?
		filters[:continents].each do |key,value|
			@tempCountries.concat(continents(key)) if value == "1"
		end
	end

	if !filters[:countries].nil?
		filters[:countries].each do |key,value|
			@tempCountries.push(key) if value == "1"
		end 
	end

	if !@tempCountries.empty?
		@filterQueries.push({terms: {"country": @tempCountries}})
	end


	if !filters[:categories].nil?
		@tempCategories = Array.new

		filters[:categories].each do |key,value|
			@tempCategories.push(key) if value == "1"
		end 
		if !@tempCategories.empty?
		    @filterQueries.push({terms: {"category.name": @tempCategories}})
		end
	end
		
	@filterQueries
	end

	def continents(region)
		case region
			when "asia"
				return ["AF","AM","AZ","BH","BD","BT","BN","KH","CN","CY","GE","HK","IN","ID","IR","IQ","IL","JP","JD","KZ","KP","KR","KW","KG","LA","LB","MO","MY","MV","MN","MM","NP","OM","PK","PS","PH","QA","SA","SG","LK","SY","TW","TJ","TH","TL","TR","TM","AE","UZ","VN","YE"]
			when "africa"
				return ["DZ","AO","BJ","BW","IO","BF","BI","CV","CM","CF","TD","KM","CG","CD","CI","DJ","EG","GQ","ER","SZ","ET","TF","GA","GM","GH","GN","GW","KE","LS","LR","LY","MG","MW","ML","MR","MU","YT","MA","MZ","NA","NE","NG","RE","RW","SH","ST","SN","SC","SL","SO","ZA","SD","TZ","TG","TN","UG","EH","ZM","ZW"]
		    when  "europe"
		    	return ["AX","AL","AD","AT","BY","BE","BA","BG","HR","CZ","DK","EE","FO","FI","FR","DE","GI","GR","HU","IS","IE","LV","JE","IT","VA","LI","LT","LU","MK","MT","MD","MC","ME","NL","NO","PL","PT","RO","RU","SM","RS","SK","SI","ES","SE","CH","UA","GB"]
			when   "north_america"
				return  ["CR","SV","GT","HN","MX","NI","PA","AI","AG","AW","BS","BB","BZ","BQ","BV","KY","CU","CW","DM","DM","GD","GP","HT","JM","MQ","MS","PR","BL","KN","LC","MF","VC","SX","TT","TC","VG","VI","CA","US"]
			when   "south_america"
				return ["AR","BO","BV","BR","CL","CO","EC","FK","GF","GY","PY","PE","GS","SR","UY","VE"]
			when "australia"
				return ["AU","CX","CC","HM","NZ","NF"]
		end
	end

end
