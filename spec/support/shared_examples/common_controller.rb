shared_examples 'common_controller' do
  let(:user) { create :user }

  before { sign_in(user) }

  describe '#index' do
    it 'returns status 200' do
      get :index

      expect(response).to have_http_status 200
    end
  end
end
