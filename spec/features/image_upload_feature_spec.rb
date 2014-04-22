require 'spec_helper' 

describe 'Uploading an image' do

   it 'displays the image on the post page' do
    toby = create(:toby)
    login_as toby
    visit '/tools/new'
    fill_in 'Description', with: "It's a drill"
    attach_file 'Picture', Rails.root.join('spec/images/hammer_drill2.jpg')
    click_button 'Submit'

    expect(page).to have_css 'img.uploaded-pic'
  end
end