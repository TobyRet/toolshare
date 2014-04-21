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
  
    context 'logged in' do
      before do
        toby = create(:toby)
        create(:tool, :toby)
      end

      it 'should be able to create a post' do 
        visit '/tools'
        expect(page).to have_content('2 years old. Excellent working order.')
      end
    end
  end

end