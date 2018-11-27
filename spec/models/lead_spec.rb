require 'rails_helper'

RSpec.describe Lead,elasticsearch: true, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  it 'should be indexed' do
     expect(Lead.__elasticsearch__.index_exists?).to be_truthy
  end
end
