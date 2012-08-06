require 'spec_helper'

describe 'Adding bookmarks' do
  module AppFragment
    attr_reader :context

    def initialize(context)
      @context = context
    end
    
    def method_missing(name, *args, &block)
      @context.send(name, *args, &block)
    end
  end

  class BookmarksForm
    include AppFragment

    def bookmark_website(attrs = {})
      open

      fill_in 'Bookmark URL', with: attrs[:url]
      click_button 'Submit bookmark'
    end

    def open
      visit new_bookmark_path
    end
  end

  class BookmarksCatalog
    include AppFragment

    def open
      visit bookmarks_path
    end

    def should_contain_website(url)
      open 

      page.should have_content(url)
    end
  end

  it "allows adding bookmarks by url" do
    bookmarks_form = BookmarksForm.new(self)
    bookmarks_catalog = BookmarksCatalog.new(self)

    bookmarks_form.bookmark_website(url: 'http://cool.site')
    bookmarks_catalog.should_contain_website('http://cool.site')
  end
end
