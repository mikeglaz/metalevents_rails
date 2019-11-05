User.seed do |s|
  s.id = 1
  s.name = 'Mike Glaz'
  s.email = 'mikeglaz@yahoo.com'
  s.password = 'a'
  s.admin = true
  s.activated = true
end

User.seed do |s|
  s.id = 2
  s.name = 'Lekizja Dingle'
  s.email = 'lekeziah.dingle@gmail.com'
  s.password = 'a'
  s.admin = false
end

User.seed do |s|
  s.id = 3
  s.name = 'Matt Glaz'
  s.email = 'mattglaz@gmail.com'
  s.password = 'a'
  s.admin = false
end

User.seed do |s|
  s.id = 4
  s.name = 'Clarisse Behr'
  s.email = 'clarisse.behr@gmail.com'
  s.password = 'a'
  s.admin = false
end
