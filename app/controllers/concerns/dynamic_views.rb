module DynamicViews
	extend ActiveSupport::Concern 

	included do
		before_action :set_dynamic_meta_info
	end 
	
	def set_dynamic_meta_info
		@page_title = "Trade"
		@page_meta  = "trade b2b exchange worldwide"
	end 
end 