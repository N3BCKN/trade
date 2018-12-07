module Searchable
	extend ActiveSupport::Concern

	included do

	include Elasticsearch::Model
	
     #custom searching methods 
	 def self.search_leads(query, status, filters = [])
	 
	    self.search({
		   	query:  multi_match_query(query,status, filters),
	        aggs:   aggregations
	      })
	  end

	  def self.aggregations
	  	{
	      group_by_country:{
	        terms:
	        	{ field: "country", 
	        	  size:  15
	        	}
	       },
	       group_by_category:{
	       	terms:{
	       		field: "category.name",
	       		size: 5
	       		}
	       }
	    }
	  end

	  def self.multi_match_query(query,status, filter)
	  		{
	          bool: {
	            must: [
	            { 
	              multi_match: {
	                query: query,
	                fields: [
	                	"title^7", 
	                	"country^3", 
	                	"city^2", 
	                	"category.name^3"]
	              },
	            },
	            {
	              match: {
	                lead_status: status
	              }
	            }],
	            filter: filter
	          }
	        }
	  end

	 settings index: { number_of_shards: 1 } do
	    mappings dynamic: false do
	      indexes :id, type: 'long'
	      indexes :country, type: 'keyword'
	      indexes :city, type: 'keyword'
	      indexes :title, analyzer: 'english', index_options: 'offsets'
	      indexes :description_short, type: 'keyword'
	      indexes :created_at, type: 'date'
	      indexes :category do 
	      	indexes :name, type: 'keyword'
	      end
	      indexes :user do
	      	indexes :user_name, type: 'keyword'
	      	indexes :id, type: 'long'
	      end
	    end
     end
  
	  def as_indexed_json(options = {})
	    self.as_json(
	      options.merge(
	        only: [:id, :lead_status, :city, :title, :description_short, :created_at,
	        :country, :product_image_file_name],
	        methods: :img_url_thumb,
	        include: { 
	        	category: { only: :name },
	        	user: { only: [:user_name, :id] }
	        }	
	      )
	    )
	  end

	end 
end 