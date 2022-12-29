class Track
  def initialize(title, artist)
    fail 'Invalid title or artist' unless title.is_a?(String) && artist.is_a?(String)
    fail 'Invalid title or artist' if title.empty? || artist.empty?
    @title = title
    @artist = artist
  end

  def matches?(keyword)
    @title.downcase.include?(keyword.downcase) || @artist.downcase.include?(keyword.downcase)
  end
end