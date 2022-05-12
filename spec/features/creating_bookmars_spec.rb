require 'pg'


feature 'Adding a new bookmark' do
    scenario 'A user can add a bookmark to Bookmark Manager' do
      visit('/bookmarks/new')
      fill_in('url',  with: 'https://www.simplybusiness.co.uk/')
			fill_in('title', with: 'SB')
      click_on('add')
  
    expect(page).to have_link('SB', href: 'https://www.simplybusiness.co.uk/')
    end


    scenario 'add the new url and the title to the database and show them all' do
			Bookmark.create(url: "http://www.miro.com",title: "Miro")
			bookmarks = Bookmark.all
			expect(bookmarks.first.url).to eq "http://www.miro.com"
			expect(bookmarks.first.title).to eq "Miro"
		end
	end


      

