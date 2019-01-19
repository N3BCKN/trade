# frozen_string_literal: true

class FavoritesController < ApplicationController
  def update
  	@favorite = FavoriteLead.where(user: current_user, lead: params[:lead])
  	if @favorite == []
  		FavoriteLead.create(user: current_user, lead: Lead.find(params[:lead]))
  		@favorite_exists = true
  	else
  		@favorite.destroy_all
  		@favorite_exists = false
  	end

  	respond_to do |format|
  		format.js
  	end
  end
end
