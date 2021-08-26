require 'sqlite3'

def detailed_tracks(db)
  # TODO: return the list of tracks with their album and artist.
  query = <<-SQL
    SELECT tracks.name, albums.title, artists.name
    FROM albums
    JOIN artists ON artists.id = albums.artist_id
    JOIN tracks ON tracks.album_id = albums.id
  SQL
  rows = db.execute(query)
end

def stats_on(db, genre_name)
  # TODO: For the given category of music, return the number of tracks and the average song length (as a stats hash)
  query = <<-SQL
    SELECT genres.name AS genre_name, COUNT(tracks.name)
    AS qtde, ROUND(AVG(tracks.milliseconds)/60000,2) AS length from genres
    JOIN tracks ON tracks.genre_id = genres.id
    WHERE genres.name = '#{genre_name}'
  SQL
  rows = db.execute(query).flatten!
  { category: rows[0], number_of_songs: rows[1], avg_length: rows[2] }
end

def top_five_artists(db, genre_name)
  # TODO: return list of top 5 artists with the most songs for a given genre.
  query = <<-SQL
    SELECT artists.id, artists.name, count(tracks.id) AS count_music
    FROM tracks
    JOIN genres ON genres.id = tracks.genre_id
    JOIN albums ON albums.id = tracks.album_id
    JOIN artists ON artists.id = albums.artist_id
    WHERE genres.name = '#{genre_name}'
    GROUP BY artists.name ORDER BY count_music DESC LIMIT 5
  SQL
  rows = db.execute(query)
end

# db = SQLite3::Database.new("db/jukebox.sqlite")
# genre_name = "Rock"
# rows = db.execute("SELECT artists.name, count(tracks.id) AS count_music
#     FROM tracks
#     JOIN genres ON genres.id = tracks.genre_id
#     JOIN albums ON albums.id = tracks.album_id
#     JOIN artists ON artists.id = albums.artist_id
#     WHERE genres.name = '#{genre_name}'
#     GROUP BY artists.name ORDER BY count_music DESC LIMIT 5")

#     p rows
