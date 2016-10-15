namespace :db do
  desc 'Fill database'
  task populate: :environment do
    require 'faker'

    # reset database
    User.destroy_all
    Place.destroy_all
    Photo.destroy_all
    Comment.destroy_all

    user = User.new(email:  'fcontreras18@gmail.com', password:  'password')
    user.save

    10.times do
      user = User.new(email:  Faker::Internet.email, password:  'password')
      user.save
    end

    users = User.all
    user_ids = User.pluck(:id)

    Place.populate(20) do |place|
      place.user_id     = user_ids.sample
      place.name        = Faker::Company.name
      place.address     = Faker::Address.street_address
      place.description = Faker::Lorem.sentence
    end

    places = Place.all
    ratings = %w(1_star 2_stars 3_stars 4_stars 5_stars)

    places.each do |place|
      5.times do
        place.comments.create!(user_id: user_ids.sample, message: Faker::Lorem.sentence, rating: ratings.sample, place_id: place.id)
      end
    end

    places.each do |place|
      10.times do
        photo = Photo.new(caption: Faker::Lorem.sentence)
        photo.user_id = user_ids.sample
        photo.place_id = place.id
        photo.picture = File.open(Dir.glob("#{Rails.root}/test/fixtures/pictures/*.jpg").sample)
        photo.save!
      end
    end
  end
end
