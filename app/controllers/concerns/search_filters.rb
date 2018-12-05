module SearchFilters
	extend ActiveSupport::Concern

	included do
		:translateFilters
	end

	def translateFilters(filters)
	@filterQueries = Array.new
	@tempCountries = Array.new
	@tempCategories = Array.new

	if !filters[:date].nil?
		@filterQueries.push({range: 
			{ created_at: {
				gte: "now-#{filters[:date]}d/d",
				lte: "now/d"
		}}}) 
	end

	if !filters[:countries].nil?
		filters[:countries].each do |key,value|
			@tempCountries.push(key) if value == "1"
		end 
		if !@tempCountries.empty?
			@filterQueries.push({terms: {"country": @tempCountries}})
		end
	end

	if !filters[:categories].nil?
		filters[:categories].each do |key,value|
			@tempCategories.push(key) if value == "1"
		end 
		if !@tempCategories.empty?
		    @filterQueries.push({terms: {"category.name": @tempCategories}})
		end
	end

		
	@filterQueries
	end
end