# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Group, type: :model do
  describe 'Group model' do
    user = User.create(name: 'Ranjeet', surname: 'Singh', email: 'ranjeet@example.com', password: '123456')
    subject { Group.new(user_id: user, name: 'cars', icon: 'icon-link') }
    before { subject.save }

    it 'check the name is not blank' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'check if the name is not exceeding 20 characters' do
      subject.name = 'Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end

    it 'check the icon is not blank' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end

    it 'check if the icon is not exceeding 20 characters' do
      subject.icon = 'Hello world Hello world Hello world Hello world Hello world Hello world
      Hello world Hello world Hello world Hello world Hello world Hello world'
      expect(subject).to_not be_valid
    end
  end
end