require 'spec_helper'

describe 'tool index page' do 

  context 'no tool listings' do

    it 'shows a message' do
      visit '/tools'
      expect(page).to have_content('No tools available yet')
    end

  end

  context 'with tool listings' do
    before do
      create(:tool)
    end

    it 'should be able to create a post' do 
      visit '/tools'
      expect(page).to have_content('2 years old. Excellent working order.')
    end
  end

end