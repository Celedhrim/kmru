require 'imdb'

module Kmru
  def self.imdbdetails(id)
    return Imdb::Movie.new(id)
  end
end
