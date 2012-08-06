class BookmarkCatalogue
  def bookmark(attrs = {})
    url = attrs[:url]

    raise BookmarkInvalid if url.blank?

    bookmarks << Bookmark.new(url)
  end

  def bookmarks
    @@bookmarks ||= []
  end

  def clear
    @@bookmarks = []
  end
end
