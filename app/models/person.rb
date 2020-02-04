class Person < ActiveRecord::Base
  has_many :addresses
  accepts_nested_attributes_for :addresses

end

# But say we have a database of songs and artists. We would want Artist rows to be unique, 
# so that Artist.find_by(name: 'Tori Amos').songs returns what we'd expect. 
# If we want to be able to create artists while creating songs, 
# we'll need to use find_or_create_by in our artist_attributes= method:


# def artist_attributes=(artist)
  #   self.artist = Artist.find_or_create_by(name: artist[:name])
  #   self.artist.update(artist)
  # end

# This looks up existing artists by name. If no matching artist is found, one is created. 
# Then we update the artist's attributes with the ones we were given. 
# We could also choose to do something else,
# if we didn't want to allow bulk assigning of an artist's information through a song.

# Note that accepts_nested_attributes_for and setter methods (e.g., artist_attributes=),
# aren't necessarily mutually exclusive. 
# It's important to evaluate the needs of your specific use case
# and choose the approach that makes the most sense. 
# Keep in mind, too, that setter methods are useful for more than just avoiding duplicates --
# that's just one domain where they come in handy.