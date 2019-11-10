require 'rails_helper'

RSpec.describe Permission, type: :model do
  context 'as guest' do
    let(:permission) { Permission.new(nil)}

    it 'allows events#index' do
      expect(permission.allowed?(:events, :index)).to be_truthy
    end

    it 'allows events#show' do
      expect(permission.allowed?(:events, :show)).to be_truthy
    end

    it 'does not allow events#new' do
      expect(permission.allowed?(:events, :new)).to be_falsey
    end

    it 'does not allow events#create' do
      expect(permission.allowed?(:events, :create)).to be_falsey
    end

    it 'does not allow events#edit' do
      expect(permission.allowed?(:events, :edit)).to be_falsey
    end

    it 'does not allow events#update' do
      expect(permission.allowed?(:events, :update)).to be_falsey
    end

    it 'does not allow events#destroy' do
      expect(permission.allowed?(:events, :destroy)).to be_falsey
    end
  end

  context 'as member user' do
    let(:permission) { Permission.new(build(:user))}

    it 'allows events#index' do
      expect(permission.allowed?(:events, :index)).to be_truthy
    end

    it 'allows events#show' do
      expect(permission.allowed?(:events, :show)).to be_truthy
    end

    it 'allows events#new' do
      expect(permission.allowed?(:events, :new)).to be_truthy
    end

    it 'allows events#create' do
      expect(permission.allowed?(:events, :create)).to be_truthy
    end

    it 'allows events#edit' do
      expect(permission.allowed?(:events, :edit)).to be_truthy
    end

    it 'allows events#update' do
      expect(permission.allowed?(:events, :update)).to be_truthy
    end

    it 'does not allow events#destroy' do
      expect(permission.allowed?(:events, :destroy)).to be_falsey
    end
  end

  context 'as admin' do
    let(:user) { build(:user, admin: true)}
    let(:permission) { Permission.new(user)}

    it 'allows events#index' do
      expect(permission.allowed?(:events, :index)).to be_truthy
    end

    it 'allows events#show' do
      expect(permission.allowed?(:events, :show)).to be_truthy
    end

    it 'allows events#new' do
      expect(permission.allowed?(:events, :new)).to be_truthy
    end

    it 'allows events#create' do
      expect(permission.allowed?(:events, :create)).to be_truthy
    end

    it 'allows events#edit' do
      expect(permission.allowed?(:events, :edit)).to be_truthy
    end

    it 'allows events#update' do
      expect(permission.allowed?(:events, :update)).to be_truthy
    end

    it 'allows events#destroy' do
      expect(permission.allowed?(:events, :destroy)).to be_truthy
    end
  end
end
