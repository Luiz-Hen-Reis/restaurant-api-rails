require 'rails_helper'

RSpec.describe Api::V1::CategoriesController, type: :controller do
    describe "GET #index" do
        let(:get_index_action) { -> { get :index, format: :json } }

        it "should return a success status" do
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

    describe "GET #show" do
        let(:get_show_action) { -> (id) { get :show, params: { id: id }, format: :json } }
        let(:category) { create(:category) }

        context "when a category exists" do
          it "should return a success status" do
            get_show_action.call(category.id)
            expect(response).to have_http_status(:success)
          end
        end

        context "when a category doesn't exists" do
          it "should return a not found status" do
              get_show_action.call('this_category_does_not_exists')
              expect(response).to have_http_status(:not_found)
          end

          it "should return a not found response" do
              get_show_action.call('this_category_does_not_exists')
              not_found_message = "Categoria não encontrada."
              expect(assigns(:error_message)).to eq(not_found_message)
          end
        end
    end
end
