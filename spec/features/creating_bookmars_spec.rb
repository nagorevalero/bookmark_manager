
feature 'Adding a new bookmark' do
    scenario 'A user can add a bookmark to Bookmark Manager' do
      visit('/bookmarks/new')
      fill_in('url', with: 'https://www.simplybusiness.co.uk/')
      click_button('add')
  
    expect(page).to have_content 'https://www.simplybusiness.co.uk/'
    end
end