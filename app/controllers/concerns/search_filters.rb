module SearchFilters
	extend ActiveSupport::Concern

	included do
		:translateFilters
	end

	def translateFilters(filters)
	@filterQueries = Array.new

	if !filters[:date].nil?
		@filterQueries.push({range: 
			{ created_at: {
				gte: "now-#{filters[:date].first}d/d",
				lte: "now/d"
		}}})
	end

	if !filters[:countries].nil?
		 @tempCountries = []

		filters[:countries].each do |key,value|
		  @tempCountries.push(key) if value == "1"
		end 
		  @filterQueries.push({"terms": {"country": @tempCountries}})
	end

	if !filters[:categories].nil?
		@tempCategories= []

		filters[:categories].each do |key,value|
		  @tempCategories.push(key) if value == "1"
		end 
		  @filterQueries.push({"terms": {"category.name": @tempCategories}})
	end

		@filterQueries
	end
end