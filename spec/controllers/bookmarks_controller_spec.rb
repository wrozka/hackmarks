require 'spec_helper'

describe BookmarksController do
  fake(:bookmark_catalogue)
  
  before do
    stub(controller).bookmark_catalogue { bookmark_catalogue }
  end

  describe "#index" do
    it "should assign bookmarks" do
      bookmarks = [Bookmark.new("cool.site")]
      stub(bookmark_catalogue).bookmarks { bookmarks }

      get :index

      assigns(:bookmarks).should == bookmarks
    end
  end

  describe "#create" do
    it "creates the bookmark" do
      mock(bookmark_catalogue).bookmark(url: 'cool.site')

      create_bookmark
    end
    
    it "redirects to bookmark catalog" do
      create_bookmark

      response.should redirect_to(bookmarks_path)
    end

    it "shows a flash message" do
      create_bookmark

      flash[:notice].should_not be_blank
    end
    
    it "renders bookmark submission form for invalid bookmarks" do
      mock(bookmark_catalogue).bookmark(url: '') { raise BookmarkInvalid }

      create_bookmark('')

      response.should render_template(:new)
    end
    
    it "shows flash message with invalid bookmark"
  end

  def create_bookmark(url = 'cool.site')
    post :create, bookmark_url: url
  end

end
