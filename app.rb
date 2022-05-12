require 'sinatra/base'
require 'sinatra/reloader'
require './model/bookmark.rb'
require 'pg'

class BookmarkManager < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    "Bookmark Manager"
  end

	get '/bookmarks' do
		@bookmarks = Bookmark.all
		erb :index
	end

  get '/bookmarks/new'do
    erb :bookmarks_new_form
  end

  post '/bookmarks'do
    @bookmarks = Bookmark.create(url: params[:url], title: params[:title])
    redirect  "/bookmarks"
  end


  run! if app_file == $0
end