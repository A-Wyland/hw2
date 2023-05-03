# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
Studo.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# completed using "rails generate model _______ " format in terminal

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.

# create warner bros table in studo (i spelt this wrong and do not know how to rename the table) table 
warnerbros = Studo.new
warnerbros["name"] = "Warner Bros."
warnerbros.save

# insert batman movies into dataset, referencing studio ID 

warnerbros = Studo.find_by({"name" => "Warner Bros."})

batman1 = Movie.new
batman1["title"] = "Batman Begins"
batman1["year_released"] = 2005
batman1["rated"] = "PG-13"
batman1["studio_id"] = warnerbros["id"]
batman1.save

batman2 = Movie.new
batman2["title"] = "The Dark Knight"
batman2["year_released"] = 2008
batman2["rated"] = "PG-13"
batman2["studio_id"] = warnerbros["id"]
batman2.save

batman3 = Movie.new
batman3["title"] = "The Dark Knight Rises"
batman3["year_released"] = 2012
batman3["rated"] = "PG-13"
batman3["studio_id"] = warnerbros["id"]
batman3.save

# insert actors into dataset

christian = Actor.new
christian["name"] = "Christian Bale"
christian.save

michael = Actor.new
michael["name"] = "Michael Caine"
michael.save

liam = Actor.new
liam["name"] = "Liam Neeson"
liam.save

katie = Actor.new
katie["name"] = "Katie Holmes"
katie.save

gary = Actor.new
gary["name"] = "Gary Oldman"
gary.save

heath = Actor.new
heath["name"] = "Heath Ledger"
heath.save

aaron = Actor.new
aaron["name"] = "Aaron Eckhart"
aaron.save

maggie = Actor.new
maggie["name"] = "Maggie Gyllenhaal"
maggie.save

tom = Actor.new
tom["name"] = "Tom Hardy"
tom.save

joseph = Actor.new
joseph["name"] = "Joseph Gordon-Levitt"
joseph.save

anne = Actor.new
anne["name"] = "Anne Hathaway"
anne.save

#insert roles into dataset, referencing movie_ids and actor_ids

bb = Movie.find_by({"title" => "Batman Begins"})
dk = Movie.find_by({"title" => "The Dark Knight"})
dkr = Movie.find_by({"title" => "The Dark Knight Rises"})
bale = Actor.find_by({"name" => "Christian Bale"})
caine = Actor.find_by({"name" => "Michael Caine"})
neeson = Actor.find_by({"name" => "Liam Neeson"})
holmes = Actor.find_by({"name" => "Katie Holmes"})
oldman = Actor.find_by({"name" => "Gary Oldman"})
ledger = Actor.find_by({"name" => "Heath Ledger"})
eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
gyll = Actor.find_by({"name" => "Maggie Gyllenhaal"})
hardy = Actor.find_by({"name" => "Tom Hardy"})
jgl = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
hath = Actor.find_by({"name" => "Anne Hathaway"})

bruce1 = Role.new
bruce1["movie_id"] = bb["id"]
bruce1["actor_id"] = bale["id"]
bruce1["character_name"] = "Bruce Wayne"
bruce1.save

bruce2 = Role.new
bruce2["movie_id"] = dk["id"]
bruce2["actor_id"] = bale["id"]
bruce2["character_name"] = "Bruce Wayne"
bruce2.save

bruce3 = Role.new
bruce3["movie_id"] = dkr["id"]
bruce3["actor_id"] = bale["id"]
bruce3["character_name"] = "Bruce Wayne"
bruce3.save

alfred1 = Role.new
alfred1["movie_id"] = bb["id"]
alfred1["actor_id"] = caine["id"]
alfred1["character_name"] = "Alfred"
alfred1.save

alfred2 = Role.new
alfred2["movie_id"] = dk["id"]
alfred2["actor_id"] = caine["id"]
alfred2["character_name"] = "Alfred"
alfred2.save

ghul = Role.new
ghul["movie_id"] = bb["id"]
ghul["actor_id"] = neeson["id"]
ghul["character_name"] = "Ra's Al Ghul"
ghul.save

dawes1 = Role.new
dawes1["movie_id"] = bb["id"]
dawes1["actor_id"] = holmes["id"]
dawes1["character_name"] = "Rachel Dawes"
dawes1.save

dawes2 = Role.new
dawes2["movie_id"] = dk["id"]
dawes2["actor_id"] = gyll["id"]
dawes2["character_name"] = "Rachel Dawes"
dawes2.save

commish1 = Role.new
commish1["movie_id"] = bb["id"]
commish1["actor_id"] = oldman["id"]
commish1["character_name"] = "Commissioner Gordon"
commish1.save

commish2 = Role.new
commish2["movie_id"] = dkr["id"]
commish2["actor_id"] = oldman["id"]
commish2["character_name"] = "Commissioner Gordon"
commish2.save

joker = Role.new
joker["movie_id"] = dk["id"]
joker["actor_id"] = ledger["id"]
joker["character_name"] = "Joker"
joker.save

dent = Role.new
dent["movie_id"] = dk["id"]
dent["actor_id"] = eckhart["id"]
dent["character_name"] = "Harvey Dent"
dent.save

bane = Role.new
bane["movie_id"] = dkr["id"]
bane["actor_id"] = hardy["id"]
bane["character_name"] = "Bane"
bane.save

blake = Role.new
blake["movie_id"] = dkr["id"]
blake["actor_id"] = jgl["id"]
blake["character_name"] = "John Blake"
blake.save

kyle = Role.new
kyle["movie_id"] = dkr["id"]
kyle["actor_id"] = hath["id"]
kyle["character_name"] = "Selina Kyle"
kyle.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
batmanmovies = Movie.all 

for batman in batmanmovies
    studio = Studo.find_by({"id" => batman["studio_id"]})
    movie_title = batman["title"]
    year_released = batman["year_released"]
    movie_rating = batman["rated"]
    movie_studio = studio["name"]
    puts "#{movie_title} #{year_released} #{movie_rating} #{movie_studio}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
leading_actors = Role.all 

for actor in leading_actors
    movieid = Movie.find_by({"id" => actor["movie_id"]})
    actorid = Actor.find_by({"id" => actor["actor_id"]})
    movie_name = movieid["title"]
    actor_name = actorid["name"]
    character_name = actor["character_name"]
    puts "#{movie_name} #{actor_name} #{character_name}"
end
