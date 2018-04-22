namespace:dev do

  task :fake => :environment do
    user = []
    20.times do
      user << User.create!(:email => Faker::Internet.email, :password => "123123Aa", :name => Faker::Name.name, :sex => "男", :age => Faker::Number.between(20, 100), :position => Faker::Company.profession)
    end

    50.times do |i|
      threat = Threat.create!(:title => Faker::Lorem.sentence,
                              :description => Faker::Lorem.paragraph)
    end
  end
end
