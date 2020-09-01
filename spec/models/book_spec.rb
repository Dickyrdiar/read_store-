require 'rails_helper'

RSpec.describe Book, type: :model do
  it 'should be indexed' do
    except(Book.__elasticsearch_.index_exists?).to be_truthy 
  end
end
