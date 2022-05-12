require 'pg'

feature 'viewing bookmarks' do
  scenario 'user can see and click on bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    
    #instead of using the first 3, we use the create method
    # connection.exec("INSERT INTO bookmarks (url) VALUES ('http://www.makersacademy.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.destroyallsoftware.com');")
    # connection.exec("INSERT INTO bookmarks (url) VALUES('http://www.google.com');")
    Bookmark.create(url: "http://www.makersacademy.com",title: "Makers")
    Bookmark.create(url:"http://www.destroyallsoftware.com", title: "Destroy all software")
    Bookmark.create(url:"http://www.google.com", title:"Google")
    
  visit '/bookmarks'

    expect(page).to have_link("Makers", href: 'http://www.makersacademy.com')
    expect(page).to have_link("Destroy all software", href:'http://www.destroyallsoftware.com')
    expect(page).to have_link("Google",href: 'http://www.google.com')
  end
end

  feature 'Open a website' do
    scenario 'when the user clicks on the page, it goes to the website' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmark.create(url: "http://www.miro.com",title: "Miro")

    visit '/bookmarks'
    click_on "Miro"

    expect(page.current_url).to have_content("www.miro.com") 
  
  end
end
