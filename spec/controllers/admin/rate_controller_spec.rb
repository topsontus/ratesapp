require 'rails_helper'

RSpec.describe Admin::RatesController, type: :controller do
  include_examples 'common_controller'

  describe '#create' do
    let(:params) do
      {
        rate: {
          forced_rate: 20.5,
          forced_rate_expiration: (Time.current + 1.day).round
        }
      }
    end

    context 'when invalid params' do
      before do
        params[:rate][:forced_rate] = 'invalid'
      end

      it 'returns status 400 with message' do
        post :create, params: params

        expect(response).to have_http_status 400
        expect(response.body).to include(['Forced rate is not a number'].to_json)
      end
    end
    context 'when valid params' do
      let(:result) do
        {
          forced_rate: params[:rate][:forced_rate].to_s,
          forced_rate_expiration: params[:rate][:forced_rate_expiration]
        }
      end

      it 'sets the forced rate' do
        expect { post :create, params: params }.to(
          have_broadcasted_to('rate').with(result)
        )
      end
    end
  end
end
