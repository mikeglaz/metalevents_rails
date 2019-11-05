Event.seed do |s|
  s.id = 1
  s.user_id = 1
  s.venue_id = 3
  s.name = 'Ghost'
  s.description = 'A Pale Tour Named Death'
  s.date_and_time = DateTime.new(2019, 7, 1, 19, 0, 0)
end

Event.seed do |s|
  s.id = 2
  s.user_id = 1
  s.venue_id = 1
  s.name = 'Metallica'
  s.description = 'World Tour 2019'
  s.date_and_time = DateTime.new(2019, 6, 5, 20, 0, 0)
end

Event.seed do |s|
  s.id = 3
  s.user_id = 2
  s.venue_id = 3
  s.name = 'Opeth'
  s.description = 'Blackwater Park Tour'
  s.date_and_time = DateTime.new(2019, 9, 1, 21, 0, 0)
end
