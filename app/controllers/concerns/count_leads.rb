# frozen_string_literal: true

module CountLeads
  extend ActiveSupport::Concern

  included do
    def leads_number
      @offers = Lead.profile_leads('offer', current_user).count
      @products = Lead.profile_leads('product', current_user).count
    end
  end
end
