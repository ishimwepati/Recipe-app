# spec/controllers/foods_controller_spec.rb
require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:food) { create(:food, user: user, name: 'Some Food') }
  # login_user

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end

    it 'assigns @foods' do
      get :index
      expect(assigns(:foods)).to eq(Food.all.includes([:ingredients]).order(created_at: :desc))
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new food to @food' do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new food' do
        expect {
          post :create, params: { food: attributes_for(:food) }
        }.to change(Food, :count).by(1)
      end

      it 'redirects to the foods index page' do
        post :create, params: { food: attributes_for(:food) }
        expect(response).to redirect_to(foods_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new food' do
        expect {
          post :create, params: { food: attributes_for(:food, name: nil) }
        }.not_to change(Food, :count)
      end

      it 'redirects to the previous page' do
        post :create, params: { food: attributes_for(:food, name: nil) }
        expect(response).to redirect_to(request.referrer)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the food' do
      food # Create the food
      expect {
        delete :destroy, params: { id: food.id }
      }.to change(Food, :count).by(-1)
    end

    it 'destroys associated ingredients' do
      ingredient = create(:ingredient, food: food)
      delete :destroy, params: { id: food.id }
      expect(Ingredient.exists?(ingredient.id)).to be_falsey
    end

    it 'redirects to the foods index page' do
      delete :destroy, params: { id: food.id }
      expect(response).to redirect_to(foods_path)
    end
  end
end
