require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "#index" do


    context 'as a guest' do
      it 'redirects to sign in page' do
        get :index
        expect(response).to redirect_to sign_in_path
      end
    end

    context "as an authenticated user" do
      it 'responds successfully' do
        user = create(:user)
        sign_in(user)

        get :index
        expect(response).to be_successful
      end
    end

    context 'as an admin' do

    end
  end

  # describe '#edit' do
  #   context 'as a guest' do

  #   end

  #   context "as an authenticated user" do
  #     it 'cannot see edit page' do
  #       user = create(:user)
  #       # sign_in(user)
  #       get :edit, params: { id: user.id }

  #       puts response
  #       # expect(page).to have_content("Please sign in")
  #     end
  #   end

  #   context 'as an admin' do
  #     it 'cannot see edit page' do
  #       user = create(:user)
  #       # sign_in(user)
  #       get :edit, params: { id: user.id }

  #       puts response
  #       # expect(page).to have_content("Please sign in")
  #     end
  #   end
  # end
end
