require 'rails_helper'

RSpec.describe User, type: :model do
  it 'testing user' do 
    user = FactoryBot.create(:user)
  end
end
