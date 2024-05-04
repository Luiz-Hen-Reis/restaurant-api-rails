require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do
    describe "GET #index" do
        let(:get_index_action) { -> { get :index, format: :json } }

        it "should return a success response" do
          get_index_action.call
          expect(response).to have_http_status(:success)
        end

        it "should fetch categories from cache if available" do
          allow(controller).to receive(:s3_cache_read).and_return([[], Time.now])
          expect(Category).not_to receive(:all)
          get_index_action.call
        end

        it "should write categories to cache if not available" do
          allow(controller).to receive(:s3_cache_read).and_return([nil, nil])
          empty_relation = double('empty_relation', order: [])
          expect(Category).to receive(:all).and_return(empty_relation)
          expect(controller).to receive(:s3_cache_write)
          get_index_action.call
          end
    end
end
