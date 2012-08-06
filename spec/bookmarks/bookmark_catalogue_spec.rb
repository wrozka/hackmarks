require 'spec_helper'

describe BookmarkCatalogue do
  verify_contract(:bookmark_catalogue)

  let(:bookmark_catalogue) { isolate(BookmarkCatalogue) }

  before { bookmark_catalogue.clear }

  it "saves bookmarks" do
    bookmark_catalogue.bookmark(url: "cool.site")
    bookmark_catalogue.bookmarks.should include(Bookmark.new("cool.site"))
  end
  
  it "is empty prior to bookmarking" do
    bookmark_catalogue.bookmarks.should be_empty
  end

  it "raises exception with invalid url" do
    expect {
      bookmark_catalogue.bookmark(url: "")
    }.to raise_error(BookmarkInvalid)
  end
  
  it "persists the bookmarks" do
    isolate(BookmarkCatalogue).bookmark(url: 'cool.site')
    isolate(BookmarkCatalogue).bookmarks.should_not be_empty
  end
end
