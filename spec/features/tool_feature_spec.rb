require 'spec_helper'

describe 'tool index page' do 

  context 'no tool listings' do

    it 'shows a message' do
      visit '/tools'
      expect(page).to have_content('No tools available yet')
    end

  end

  describe 'adding a listing' do

    context 'logged out' do
      it 'takes the user to the signed out page' do
        visit '/tools'
        click_link 'Loan your tools'
        expect(current_path).to eq('/users/sign_in')
        expect(page).to have_content('Sign in')
      end
    end
  
    context 'with posts' do

      before do
        toby = create(:toby)
        create(:tool, user: toby)
      end

      it 'should be able to view a thumbnail post on homepage' do 
        visit '/tools'
        expect(page).to have_content('Hitachi Hammer Drill')
      end

      it 'should be able to full listing' do
        visit 'tools'
        click_link('Hitachi Hammer Drill')
        expect(page).to have_content('2 years old. Excellent working order.')
      end

    end

  end

end