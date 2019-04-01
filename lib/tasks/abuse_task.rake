# frozen_string_literal: true

namespace :abuse do
  desc 'Fetch abuses from last three days'
  task fetch: :environment do
    @abuses = Abuse.where('created_at >= ?', Time.current - 3.days)
    puts @abuses.first.inspect
  end
end
