require 'rails_helper'

RSpec.describe Api::V1::ProductsController, type: :controller do
  describe "GET #index" do
    let(:get_index_action) { -> (page = nil, limit = nil) { get :index, params: { page: page, limit: limit }.compact, format: :json } }

    before { create_list(:product, 10) }

    it "should return a success status" do
        get_index_action.call
        expect(response).to have_http_status(:success)
    end

    it "should return only default number of products when no pagination param is provided" do
        get_index_action.call
        expect(assigns(:products).count).to eq(8)
    end

    it "should return paginated products when pagination parameters are provided" do
        get_index_action.call(2, 5)
        expect(assigns(:products).count).to eq(5)
    end
  end

  describe "GET #show" do
    let(:product) { create(:product) }
    let(:get_show_action) { -> (id) { get :show, params: { id: id }, format: :json } }


    context "when the product exists" do
      it "should return a success status" do
          get_show_action.call(product.id)
          expect(response).to have_http_status(:success)
      end

      it "should return the requested product" do
          get_show_action.call(product.id)
          expect(assigns(:product)).to eq(product)
      end
    end

    context "when the product doesn't exists" do
      it "should return a not found status if the product doesn't exists" do
          get_show_action.call("this_product_does_not_exists")
          expect(response).to have_http_status(:not_found)
      end

      it "should return a not found response" do
        get_show_action.call('this_category_does_not_exists')
        not_found_message = "Produto não encontrado."
        expect(assigns(:error_message)).to eq(not_found_message)
      end
    end

  end
end
