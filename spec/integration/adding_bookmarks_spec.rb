require 'spec_helper'

describe 'Adding bookmarks', :wip do
  class BookmarksForm
    attr_reader :page

    def initialize(page)
      @page = page
    end

    def bookmark_website(attrs = {})
      open
    end

    def open
      page.visit page.new_bookmark_path
    end
  end

  class BookmarksCatalog
    def should_contain_website(url)
    end
  end

  it "allows adding bookmarks by url" do
    bookmarks_form = BookmarksForm.new(self)
    bookmarks_catalog = BookmarksCatalog.new

    bookmarks_form.bookmark_website(url: 'http://cool.site')
    bookmarks_catalog.should_contain_website('http://cool.site')
  end
end
