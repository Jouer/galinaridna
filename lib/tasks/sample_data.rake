namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
  	make_users
    
  end
end

def make_users
    admin1 = User.create!(name: "Jouet",
                 email: "yves.tatienne@gmail.com",
                 password: "foobar",
                 password_confirmation: "foobar",
                 admin: true)
     admin2 = User.create!(name: "Tutta3",
                 email: "tet.volf@gmail.com",
                 password: "ludovik14",
                 password_confirmation: "ludovik14",
                 admin: true)
                 99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
 end
end

