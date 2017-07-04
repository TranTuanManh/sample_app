User.create!(name:  "Example User",
  sex: "male",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  admin: true)

99.times do |n|
  name  = Faker::Name.name
  sex = "male" || "female"
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    sex: sex,
    email: email,
    password: password,
    password_confirmation: password)
end
