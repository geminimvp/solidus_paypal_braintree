# frozen_string_literal: true

require 'spec_helper'

module Spree
  describe Api::OrdersController, type: :request do
    stub_authorization!

    let!(:order) { create(:order_ready_to_ship) }

    let(:api_user_params) {
      {
        email: "spree@example.com",
        password: "password",
        password_confirmation: "password",
      }
    }

    let(:request_headers) {
      {
        'X-SPREE-TOKEN' => current_api_user.spree_api_key,
      }
    }

    let!(:current_api_user) {
      user = Spree.user_class.new(api_user_params)
      user.generate_spree_api_key!
      user
    }

    describe 'GET show' do
      subject do
        get spree.api_orders_path, params: api_order_params, headers: request_headers
        response
      end

      let(:api_order_params) {
        {
          id: order.number,
        }
      }

      # let(:json_response) {
      #   case body = JSON.parse(response.body)
      #   when Hash
      #     body.with_indifferent_access
      #   when Array
      #     body
      #   end
      # }

      it 'returns the order in the JSON' do
        subject
        expect(response).to have_http_status(:success)
        expect(json_response['orders'].first['number']).to eq(order.number)
      end
    end

  end
end
