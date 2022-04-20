# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'groups#index', type: :feature do
  describe 'Group' do
    before(:each) do
      @user = User.create(name: 'Ranjeet', surname: 'Singh', email: 'amy@gmail.com', password: 'password')
      visit new_user_session_path
      fill_in 'Email', with: 'amy@gmail.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'

      @group1 = Group.create(user: @user, name: 'Cars', icon: 'https://icon-link')
      @group2 = Group.new(user: @user, name: 'Foods', icon: 'icon-link')
      @group3 = Group.new(user: @user, name: 'Drinks', icon: 'icon-link')
      @group4 = Group.new(user: @user, name: 'Grocery', icon: 'icon-link')

      visit(groups_path)
    end

    it 'shows the group name' do
      expect(page).to have_content('Cars')
    end

    it 'shows the group icon' do
      expect(page).to have_content('recent')
    end
  end
end