require 'pry'

class Song
    attr_accessor :name, :artist, :genre

    @@count = 0
    @@genres = []
    @@artists = []

    def initialize(name, artist, genre)
        @name = name
        @artist = artist
        @genre = genre
        @@count += 1
        @@genres << genre
        @@artists << artist
    end

    def self.count
        @@count
    end

    def self.genres
        @@genres.uniq
    end

    def self.artists
        @@artists.uniq
    end

    def self.genre_count
        # { "pop" => 1, "rap" => 2 }
        genre_hash = {}
        # @@genres.each do |genre|
        #     if genre_hash[genre]
        #         genre_hash[genre] += 1
        #     else 
        #         genre_hash[genre] = 1
        #     end
        # end
        @@genres.each {|genre| genre_hash[genre] ? genre_hash[genre] += 1 : genre_hash[genre] = 1}
        genre_hash
        # h = Hash.new(0)
        # @@genres.each { | genre | h.store(genre, h[genre]+1) }
        # h
    end

    def self.artist_count
        artists_hash = Hash.new(0)
        @@artists.each {|artist| artists_hash.store(artist, artists_hash[artist]+1)}
        artists_hash
        # @@genres.reduce({}){|hash, genre| hash.store(genre, hash[genre]+1)}
    end

end

ninety_nine_problems = Song.new("99 Problems", "Jay-Z", "rap")

binding.pry