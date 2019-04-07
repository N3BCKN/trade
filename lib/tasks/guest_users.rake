# frozen_string_literal: true

  desc 'Delete guest users visits from previous 24 hours'
  task clean_visits: :environment do
    View.where("created_at <= ?", 24.hour.ago).destroy_all
    puts "Guest Views destroyed at: #{Time.current}"
  end
