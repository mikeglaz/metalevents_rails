require 'rails_helper'

RSpec.describe Permission, type: :model do
  # context 'events' do
  #   context 'as guest' do
  #     let(:permission) { Permission.new(nil)}

  #     it 'allows events#index' do
  #       expect(permission.allow?(:events, :index)).to be_truthy
  #     end

  #     it 'allows events#show' do
  #       expect(permission.allow?(:events, :show)).to be_truthy
  #     end

  #     it 'does not allow events#new' do
  #       expect(permission.allow?(:events, :new)).to be_falsey
  #     end

  #     it 'does not allow events#create' do
  #       expect(permission.allow?(:events, :create)).to be_falsey
  #     end

  #     it 'does not allow events#edit' do
  #       expect(permission.allow?(:events, :edit)).to be_falsey
  #     end

  #     it 'does not allow events#update' do
  #       expect(permission.allow?(:events, :update)).to be_falsey
  #     end

  #     it 'does not allow events#destroy' do
  #       expect(permission.allow?(:events, :destroy)).to be_falsey
  #     end
  #   end

  #   context 'as member user' do
  #     let(:user) { create(:user) }
  #     let(:user_event) { build(:event, user: user) }
  #     let(:other_event) { build(:event) }
  #     let(:permission) { Permission.new(user)}

  #     it 'allows events#index' do
  #       expect(permission.allow?(:events, :index)).to be_truthy
  #     end

  #     it 'allows events#show' do
  #       expect(permission.allow?(:events, :show)).to be_truthy
  #     end

  #     it 'allows events#new' do
  #       expect(permission.allow?(:events, :new)).to be_truthy
  #     end

  #     it 'allows events#create' do
  #       expect(permission.allow?(:events, :create)).to be_truthy
  #     end

  #     it 'does not allow events#edit' do
  #       expect(permission.allow?(:events, :edit)).to be_falsey
  #     end

  #     it 'does not allow events#update' do
  #       expect(permission.allow?(:events, :update)).to be_falsey
  #     end

  #     it 'does not allow #edit of other user\'s event' do
  #       expect(permission.allow?(:events, :edit, other_event)).to be_falsey
  #     end

  #     it 'does not allow #update of other user\'s event' do
  #       expect(permission.allow?(:events, :update, other_event)).to be_falsey
  #     end

  #     it 'allows #edit for own event' do
  #       expect(permission.allow?(:events, :edit, user_event)).to be_truthy
  #     end

  #     it 'allows #update for own event' do
  #       expect(permission.allow?(:events, :update, user_event)).to be_truthy
  #     end

  #     it 'does not allow events#destroy' do
  #       expect(permission.allow?(:events, :destroy)).to be_falsey
  #     end
  #   end

  #   context 'as admin' do
  #     let(:user) { build(:user, admin: true)}
  #     let(:permission) { Permission.new(user)}

  #     it 'allows events#index' do
  #       expect(permission.allow?(:events, :index)).to be_truthy
  #     end

  #     it 'allows events#show' do
  #       expect(permission.allow?(:events, :show)).to be_truthy
  #     end

  #     it 'allows events#new' do
  #       expect(permission.allow?(:events, :new)).to be_truthy
  #     end

  #     it 'allows events#create' do
  #       expect(permission.allow?(:events, :create)).to be_truthy
  #     end

  #     it 'allows events#edit' do
  #       expect(permission.allow?(:events, :edit)).to be_truthy
  #     end

  #     it 'allows events#update' do
  #       expect(permission.allow?(:events, :update)).to be_truthy
  #     end

  #     it 'allows events#destroy' do
  #       expect(permission.allow?(:events, :destroy)).to be_truthy
  #     end
  #   end
  # end

  context 'venues' do
    context 'as guest' do
      let(:permission) { Permission.new(nil)}

      it 'allows venues#index' do
        expect(permission.allow?(:events, :index)).to be_truthy
      end

      it 'allows venues#show' do
        expect(permission.allow?(:venues, :show)).to be_truthy
      end

      it 'does not allow venues#new' do
        expect(permission.allow?(:venues, :new)).to be_falsey
      end

      it 'does not allow venues#create' do
        expect(permission.allow?(:venues, :create)).to be_falsey
      end

      it 'does not allow venues#edit' do
        expect(permission.allow?(:venues, :edit)).to be_falsey
      end

      it 'does not allow venues#update' do
        expect(permission.allow?(:venues, :update)).to be_falsey
      end

      it 'does not allow venues#destroy' do
        expect(permission.allow?(:venues, :destroy)).to be_falsey
      end
    end

    context 'as admin' do
      let(:user) { build(:user, admin: true)}
      let(:permission) { Permission.new(user)}

      it 'allows venues#index' do
        expect(permission.allow?(:venues, :index)).to be_truthy
      end

      it 'allows venues#show' do
        expect(permission.allow?(:venues, :show)).to be_truthy
      end

      it 'allows venues#new' do
        expect(permission.allow?(:venues, :new)).to be_truthy
      end

      it 'allows venues#create' do
        expect(permission.allow?(:venues, :create)).to be_truthy
      end

      it 'allows venues#edit' do
        expect(permission.allow?(:venues, :edit)).to be_truthy
      end

      it 'allows venues#update' do
        expect(permission.allow?(:venues, :update)).to be_truthy
      end

      it 'allows venues#destroy' do
        expect(permission.allow?(:venues, :destroy)).to be_truthy
      end
    end
  end

  context 'calendar' do
    context 'as guest' do
      it 'allows'
    end
  end
end
