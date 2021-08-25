require 'sqlite3'

def artist_count(db)
  # TODO: use `db` to execute an SQL query against the database.
  rows = db.execute("SELECT COUNT(*) FROM artists")
  return rows.first.first
end

def number_of_rows(db, table_name)
  # TODO: count number of rows in table table_name
  rows = db.execute("SELECT COUNT(*) AS QTDE FROM #{table_name}")
  return rows.first.first
end

def sorted_artists(db)
  # TODO: return array of artists' names sorted alphabetically
  rows = db.execute("SELECT artists.name AS name FROM artists ORDER BY name ASC")
  return rows.flatten!
end

def love_tracks(db)
  # TODO: return array of love songs' names
  rows = db.execute("SELECT tracks.name AS name FROM tracks where tracks.name like '%LOVE%'")
  return rows.flatten!
end

def long_tracks(db, min_length)
  # TODO: return an array of tracks' names verifying: duration > min_length (minutes) sorted by length (ascending)
  rows = db.execute("SELECT name FROM tracks where milliseconds > '#{min_length * 60_000}' ORDER by milliseconds ASC")
  return rows.flatten!
end
