require 'spec_helper'

describe 'commenting on posts' do

  let(:toby) {create(:toby)}
  let(:tool) {create(:tool, user: toby)}

  it 'begins with no comments' do
    visit "/tools/#{tool.id}"
    expect(page).to have_content '0 comments'
  end

  it 'adds the new comment' do
    visit '/tools/1'
    click_link 'Add a comment'
    fill_in 'Comment', with: 'Can you tell me how to use this?'
    click_button 'Create Comment'

    expect(page).to have_content '1 comment'
  end

  xit 'displays a comment', js: true do
    create(:comment, post: post)
    click_link '1 comment'
    expect(page).to have_content('This is a lovely cat')

  end
  
end