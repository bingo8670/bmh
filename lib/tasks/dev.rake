namespace:dev do

  task :fake => :environment do
    user = []
    10.times do
      user << User.create!(:email => Faker::Internet.email, :password => "123123Aa")
    end

    50.times do |i|
      threat = Threat.create!(:title => Faker::Lorem.sentence,
                              :description => Faker::Lorem.paragraph)
    end
  end
end

