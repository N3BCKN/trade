module FavoritesHelper
	def check_favorite
		@favorite_exists ?  "Remove from Favorites" : "Add to favorites"
	end
end
