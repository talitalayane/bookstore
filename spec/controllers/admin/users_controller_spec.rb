require 'rails_helper'

RSpec.describe Admin::UsersController, type: :controller do
  before do
    allow(controller).to receive(:authenticate_admin).and_return(true)
    allow(controller).to receive(:current_admin).and_return(Admin.new(id: 1, name: 'Admin'))
  end

  describe 'GET #index' do
    it 'searches users by name and email' do
      alice = User.create!(name: 'Alice Silva', email: 'alice@example.com', password: '123456')
      bob = User.create!(name: 'Bob Santos', email: 'bob@example.com', password: '123456')

      get :index, params: { query: 'alice' }

      expect(controller.instance_variable_get(:@users)).to include(alice)
      expect(controller.instance_variable_get(:@users)).not_to include(bob)
    end
  end
end
