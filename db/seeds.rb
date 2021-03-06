# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Stream.create(name: 'netflix', url: "https://reelgood.com/movies/source/netflix?filter-sort=1")#1
Stream.create(name: 'hulu', url: "https://reelgood.com/movies/source/hulu?filter-sort=1")#1
Stream.create(name: 'amazon', url: "https://reelgood.com/movies/source/amazon?filter-sort=1")#3
Stream.create(name: 'hbo', url: "https://reelgood.com/movies/source/hbo_max?filter-sort=1")#4
Stream.create(name: 'disney', url: "https://reelgood.com/movies/source/disney_plus?filter-sort=1")#5
Stream.create(name: 'showtime', url: "https://reelgood.com/movies/source/showtime?filter-sort=1")#6
Stream.create(name: 'starz', url: "https://reelgood.com/movies/source/starz?filter-sort=1")#7
Stream.create(name: 'cinimax', url: "https://reelgood.com/movies/source/cinemax?filter-sort=1")#8
Stream.create(name: 'dc', url: "https://reelgood.com/movies/source/dc_universe?filter-sort=1")#9
Stream.create(name: 'apple', url: "https://reelgood.com/movies/source/apple_tv_plus?filter-sort=1")#10
Stream.create(name: 'epix', url: "https://reelgood.com/movies/source/epix?filter-sort=1")#11
Stream.create(name: 'tbs', url: "https://reelgood.com/movies/source/tbs?filter-sort=1")#12
Stream.create(name: 'tnt', url: "https://reelgood.com/movies/source/tnt?filter-sort=1")#13
Stream.create(name: 'shudder', url: "https://reelgood.com/movies/source/shudder?filter-sort=1")#14
Stream.create(name: 'amc', url: "https://reelgood.com/movies/source/amc?filter-sort=1")#15
Stream.create(name: 'fx', url: "https://reelgood.com/movies/source/fx?filter-sort=1")#16
Stream.create(name: 'syfy', url: "https://reelgood.com/movies/source/syfy?filter-sort=1")#17
Stream.create(name: 'ifc', url: "https://reelgood.com/movies/source/ifc?filter-sort=1")#18
Stream.create(name: 'peacock', url: "https://reelgood.com/movies/source/peacock?filter-sort=1")#19
Stream.create(name: 'paramount', url: "https://reelgood.com/movies/source/paramount_plus?filter-sort=1")#20

Scraper.create(count: "0")
