namespace :db do
  desc "Fill database"
  task :populate => :environment do
    require 'faker'

    [Place, Photo].each(&:delete_all)

    Place.populate 50 do |place|
      place.name        = Faker::Company.name
      place.address     = Faker::Address.street_address
      place.description = Faker::Lorem.sentence      
      Photo.populate 10 do |photo|
        photo.caption     = Faker::Lorem.sentence
        photo.picture     = Faker::Avatar.image
      end    
    end
  end
end

# Places.all.each do  | place |
#   Photo.create!(picture: Faker::Avatar::image("random sentence", "250x250", "jpg") )
# end