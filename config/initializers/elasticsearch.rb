# Elasticsearch::Model.client = Elasticsearch::Client.new({
#   log: true
# })
Elasticsearch::Model.client = Elasticsearch::Client.new url: ENV['BONSAI_URL']