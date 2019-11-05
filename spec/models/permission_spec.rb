require 'rails_helper'

RSpec.describe Permission, type: :model do
  context 'as guest' do
    let(:permission) { Permission.new(nil)}

    it 'allows events#index' do
      expect(permission.allow?("events", "index")).to be_truthy
    end

    it 'allows events#show' do
      expect(permission.allow?("events", "show")).to be_truthy
    end

    it 'does not allow events#new' do
      expect(permission.allow?("events", "new")).to be_falsey
    end

    it 'does not allow events#create' do
      expect(permission.allow?("events", "create")).to be_falsey
    end

    it 'does not allow events#edit' do
      expect(permission.allow?("events", "edit")).to be_falsey
    end

    it 'does not allow events#update' do
      expect(permission.allow?("events", "update")).to be_falsey
    end

    it 'does not allow events#destroy' do
      expect(permission.allow?("events", "destroy")).to be_falsey
    end
  end

  context 'as member user' do
    let(:permission) { Permission.new(build(:user))}

    it 'allows events#index' do
      expect(permission.allow?("events", "index")).to be_truthy
    end

    it 'allows events#show' do
      expect(permission.allow?("events", "show")).to be_truthy
    end

    it 'does not allow events#new' do
      expect(permission.allow?("events", "new")).to be_truthy
    end

    it 'does not allow events#create' do
      expect(permission.allow?("events", "create")).to be_truthy
    end

    it 'does not allow events#edit' do
      expect(permission.allow?("events", "edit")).to be_truthy
    end

    it 'does not allow events#update' do
      expect(permission.allow?("events", "update")).to be_truthy
    end

    it 'does not allow events#destroy' do
      expect(permission.allow?("events", "destroy")).to be_falsey
    end
  end

  context 'as admin' do
    let(:permission) { Permission.new(build(:admin))}

    it 'allows events#index' do
      expect(permission.allow?("events", "index")).to be_truthy
    end

    it 'allows events#show' do
      expect(permission.allow?("events", "show")).to be_truthy
    end

    it 'does not allow events#new' do
      expect(permission.allow?("events", "new")).to be_truthy
    end

    it 'does not allow events#create' do
      expect(permission.allow?("events", "create")).to be_truthy
    end

    it 'does not allow events#edit' do
      expect(permission.allow?("events", "edit")).to be_truthy
    end

    it 'does not allow events#update' do
      expect(permission.allow?("events", "update")).to be_truthy
    end

    it 'does not allow events#destroy' do
      expect(permission.allow?("events", "destroy")).to be_truthy
    end
  end
end
