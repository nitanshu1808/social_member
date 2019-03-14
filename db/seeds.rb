admins =
[
  { email: 'nitanshu@abc.com', name: 'Nitanshu Rehani' },
  { email: 'john@snow.com',    name: 'John Snow' }
]

admins.each do |obj|
  Admin.create({
    email:      obj[:email],
    name:       obj[:name],
    password:   obj[:email]
  })
end
